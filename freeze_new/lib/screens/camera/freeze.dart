import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freeze_new/models/color.dart';
import 'package:freeze_new/models/font.dart';
import 'package:freeze_new/screens/camera/get_guide.dart';
import 'package:freeze_new/screens/camera/preview.dart';
import 'package:freeze_new/utilities/utility.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Freeze extends StatefulWidget {
  final List<CameraDescription>? cameras;
  const Freeze({Key? key, required this.cameras}) : super(key: key);

  @override
  _FreezeState createState() => _FreezeState();
}

class _FreezeState extends State<Freeze> {
  late CameraController _cameraController;
  bool _isRearCameraSelected = true;
  bool? _isGridOn = false;
  double gridOpacity = 0;
  bool? _isGridGuideOn = false;

  bool isEdgeGuideOn = false;
  double edgeGuideOpacity = 0;

  double tilt = -1.5;
  String tiltSource = "assets/images/TiltGood.gif";

  String tiltIn = "assets/images/TiltIn.gif";
  String tiltOut = "assets/images/TiltOut.gif";
  String tiltGood = "assets/images/TiltGood.gif";

  String horizionSource = "assets/images/HorizionGood.gif";

  String horizionLeft = "assets/images/HorizionLeft.gif";
  String horizionRight = "assets/images/HorizionRight.gif";
  String horizionGood = "assets/images/HorizionGood.gif";

  @override
  void initState() {
    super.initState();
    initCamera(widget.cameras![0]);
    if (mounted) {
      accelerometerEvents.listen((AccelerometerEvent e) {
        setState(() {
          if (e.z > tilt + 0.3) {
            tiltSource = tiltIn;
          } else if (e.z < tilt - 0.3) {
            tiltSource = tiltOut;
          } else {
            tiltSource = tiltGood;
          }
          if (e.x > 0.3) {
            horizionSource = horizionRight;
          } else if (e.x < -0.3) {
            horizionSource = horizionLeft;
          } else {
            horizionSource = horizionGood;
          }
        });
      });
    }
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _cameraController.dispose();
    super.dispose();
  }

  Future initCamera(CameraDescription cameraDescription) async {
// create a CameraController
    _cameraController =
        CameraController(cameraDescription, ResolutionPreset.ultraHigh);
// Next, initialize the controller. This returns a Future.
    try {
      await _cameraController.initialize().then((_) {
        if (!mounted) return;
        setState(() {});
      });
    } on CameraException catch (e) {
      debugPrint("camera error $e");
    }
  }

  void onTakePicture() async {
    await _cameraController.takePicture().then((XFile xfile) {
      if (mounted) {
        if (xfile != null) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Ambil Gambar'),
              content: SizedBox(
                width: 200.0,
                height: 200.0,
                child: CircleAvatar(
                    // backgroundImage: Image.file(
                    //   // File(xfile.path),
                    // ).image,
                    ),
              ),
            ),
          );
        }
      }
      return;
    });
  }

  Future takePicture() async {
    if (!_cameraController.value.isInitialized) {
      return null;
    }
    if (_cameraController.value.isTakingPicture) {
      return null;
    }
    try {
      await _cameraController.setFlashMode(FlashMode.off);
      XFile picture = await _cameraController.takePicture();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Preview(
                    picture: picture,
                  )));
    } on CameraException catch (e) {
      debugPrint('Error occured while taking picture: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 30,
          ),
          Container(
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back)),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    child: TextButton(
                        onPressed: () {}, child: Icon(Icons.fullscreen)),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    child: TextButton(
                        onPressed: () {
                          if (mounted) {
                            setState(() {
                              _isGridOn = !_isGridOn!;
                              gridOpacity = _isGridOn! ? 0.5 : 0;
                            });
                          }
                        },
                        child: Icon(Icons.grid_on)),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    child: TextButton(
                        onPressed: () {
                          if (mounted) {
                            setState(() {
                              _isRearCameraSelected = !_isRearCameraSelected;
                            });
                            initCamera(
                                widget.cameras![_isRearCameraSelected ? 0 : 1]);
                          }
                        },
                        child: Icon(Icons.flip_camera_ios_rounded)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        horizionSource,
                        height: 50,
                      ),
                      Text("수평계", style: FontKoMgr.Overline)
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        tiltSource,
                        width: 70,
                      ),
                      Text("기울기", style: FontKoMgr.Overline)
                    ],
                  ),
                ],
              )
            ]),
          ),
          Container(
              height: MediaQuery.of(context).size.height - 148,
              child: SafeArea(
                child: Stack(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      (_cameraController.value.isInitialized)
                          ? CameraPreview(_cameraController)
                          : Container(
                              color: Colors.black,
                              child: const Center(
                                  child: CircularProgressIndicator())),
                    ],
                  ),
                  if (isEdgeGuideOn)
                    Align(
                      alignment: Alignment.center,
                      child: AspectRatio(
                        aspectRatio: 0.8 / 0.8,
                        child: Image.asset(
                          'assets/images/eric_at_ocean_edge.png',
                          fit: BoxFit.cover,
                          opacity: AlwaysStoppedAnimation(edgeGuideOpacity),
                        ),
                      ),
                    ),
                  if (_isGridOn!)
                    AspectRatio(
                      aspectRatio: 3 / 4,
                      child: Image.asset(
                        'assets/images/Grid.png',
                        fit: BoxFit.cover,
                        opacity: AlwaysStoppedAnimation(gridOpacity),
                      ),
                    ),
                  if (_isGridOn!)
                    IconButton(
                      icon: Icon(Icons.question_mark),
                      color: Colors.white,
                      iconSize: 24.0,
                      onPressed: () {
                        if (mounted) {
                          setState(() {
                            _isGridGuideOn = true;
                          });
                        }
                      },
                    ),
                  if (_isGridGuideOn!)
                    AspectRatio(
                      aspectRatio: 3 / 4,
                      child: Image.asset(
                        'assets/images/Guide_Grid.png',
                        fit: BoxFit.cover,
                        opacity: AlwaysStoppedAnimation(1),
                      ),
                    ),
                  if (_isGridGuideOn!)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: Icon(Icons.cancel_outlined),
                          color: Colors.white,
                          iconSize: 24.0,
                          onPressed: () {
                            if (mounted) {
                              setState(() {
                                _isGridGuideOn = false;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Stack(
                              children: [
                                if (isEdgeGuideOn)
                                  Opacity(
                                    opacity: 0.3,
                                    child: Container(
                                      height: 40,
                                      color: Color(
                                        Colors.white.value,
                                      ),
                                    ),
                                  ),
                                if (isEdgeGuideOn)
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            child: DefaultTextStyle(
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.0,
                                            fontFamily: 'NotoSansKR_Medium',
                                          ),
                                          child: AnimatedTextKit(
                                              repeatForever: true,
                                              animatedTexts: [
                                                RotateAnimatedText(
                                                    '1. 머리를 가운데 격자의 중앙에,'),
                                                RotateAnimatedText(
                                                    '발끝을 가운데 아래 격자의 중앙에 맞춰주세요.'),
                                                RotateAnimatedText(
                                                    '2. 한쪽 다리를 앞으로 빼 주시면'),
                                                RotateAnimatedText(
                                                    '훨씬 다리가 길어 보여요.'),
                                                RotateAnimatedText(
                                                    '3. 시선이나 표정이 어색하실 때에는'),
                                                RotateAnimatedText(
                                                    '먼 쪽을 보시거나 휴대폰을 보셔도 좋아요.'),
                                                RotateAnimatedText(
                                                    '4. 위에서 내리쬐는 조명이 아닌,'),
                                                RotateAnimatedText(
                                                    '옆에서 비추는 조명이 잘 나와요.'),
                                                RotateAnimatedText(
                                                    '5. 무작정 앉지 마시고, 선 상태에서 찍어 주세요.'),
                                              ]),
                                        ))
                                      ]),
                              ],
                            ),
                            Container(
                              height: 30,
                            ),
                            Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(24)),
                                    color: Colors.white),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    isEdgeGuideOn
                                        ? Slider(
                                            value: edgeGuideOpacity,
                                            min: 0,
                                            max: 1,
                                            // divisions: 5,
                                            label: "label",
                                            onChanged: (newValue) {
                                              if (mounted) {
                                                setState(
                                                  () {
                                                    edgeGuideOpacity = newValue;
                                                  },
                                                );
                                              }
                                            },
                                          )
                                        : Container(
                                            height: 48,
                                          ),
                                    Container(
                                      height: 20,
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            child: Column(children: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (_) =>
                                                              GetGuide()));
                                                },
                                                child:
                                                    Icon(Icons.upload_rounded),
                                              ),
                                              Text(
                                                "가져오기",
                                                style: FontKoMgr.Overline,
                                              )
                                            ]),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              takePicture();
                                            }, // Image tapped
                                            child: Image.asset(
                                              'assets/images/icon/BTN_camera.png',
                                              fit: BoxFit
                                                  .cover, // Fixes border issues
                                              width: 80.0,
                                              height: 80.0,
                                            ),
                                          ),
                                          Container(
                                            child: Column(children: [
                                              SizedBox(
                                                width: 68,
                                                height: 53,
                                                child: FittedBox(
                                                  fit: BoxFit.fill,
                                                  child: Switch(
                                                    value: isEdgeGuideOn,
                                                    onChanged: (value) {
                                                      if (mounted) {
                                                        setState(() {
                                                          isEdgeGuideOn = value;
                                                        });
                                                      }
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "가이드 켜기",
                                                style: FontKoMgr.Overline,
                                              )
                                            ]),
                                          ),
                                        ]),
                                  ],
                                ))
                          ])),
                ]),
              ))
        ],
      ),
    );
  }
}
