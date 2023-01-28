import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class Freeze extends StatefulWidget {
  const Freeze({Key? key}) : super(key: key);

  @override
  _FreezeState createState() => _FreezeState();
}

class _FreezeState extends State<Freeze> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();
  }

  Future<void> initializationCamera() async {
    var cameras = await availableCameras();
    controller = CameraController(
      cameras[EnumCameraDescription.back.index],
      ResolutionPreset.medium,
      imageFormatGroup: ImageFormatGroup.yuv420,
    );
    await controller.initialize();
  }

  void onTakePicture() async {
    await controller.takePicture().then((XFile xfile) {
      if (mounted) {
        if (xfile != null) {
          // showDialog(
          //   context: context,
          //   builder: (context) => AlertDialog(
          //     title: Text('Ambil Gambar'),
          //     content: SizedBox(
          //       width: 200.0,
          //       height: 200.0,
          //       child: CircleAvatar(
          //         backgroundImage: Image.file(
          //           File(xfile.path),
          //         ).image,
          //       ),
          //     ),
          //   ),
          // );
        }
      }
      return;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  child: TextButton(
                      onPressed: () {}, child: Icon(Icons.arrow_back)),
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
                  child:
                      TextButton(onPressed: () {}, child: Icon(Icons.grid_on)),
                ),
                Container(
                  height: 40,
                  width: 40,
                  child: TextButton(
                      onPressed: () {},
                      child: Icon(Icons.flip_camera_ios_rounded)),
                ),
              ],
            ),
          ),
          FutureBuilder(
            future: initializationCamera(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    AspectRatio(
                      aspectRatio: 3 / 4,
                      child: CameraPreview(controller),
                    ),
                    AspectRatio(
                      aspectRatio: 3 / 4,
                      child: Image.asset(
                        'assets/images/camera-overlay-conceptcoder.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    InkWell(
                      onTap: () => onTakePicture(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: CircleAvatar(
                          radius: 30.0,
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

enum EnumCameraDescription { front, back }
