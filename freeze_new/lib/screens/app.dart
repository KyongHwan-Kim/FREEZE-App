import 'package:flutter/material.dart';
import 'package:freeze_new/models/color.dart';
import 'package:freeze_new/screens/camera/freeze_camera.dart';
import 'package:freeze_new/utilities/utility.dart';
import 'package:freeze_new/map/map.dart';
import 'package:camera_platform_interface/camera_platform_interface.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

List<CameraDescription> _cameras = <CameraDescription>[];

class _AppState extends State<App>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  int _selectedIndex = 0;
  String route = 'photo_map';
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _selectedIndex == 1
            ? Profile()
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 40,
                          width: 170,
                          decoration: BoxDecoration(
                              color: this.route == 'photo_map'
                                  ? fromHex(Signiture.PrimaryNormal)
                                  : fromHex(GrayScale.White),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 2,
                                color: fromHex(Signiture.PrimaryNormal),
                              )),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                this.route = 'photo_map';
                              });
                            },
                            child: Text(
                              'Photo Map',
                              style: TextStyle(
                                fontFamily: "Montserrat_Extrabold",
                                fontSize: 14,
                                color: this.route == 'photo_map'
                                    ? fromHex(GrayScale.White)
                                    : fromHex(Signiture.PrimaryNormal),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 170,
                          decoration: BoxDecoration(
                              color: this.route == 'freeze'
                                  ? fromHex(Signiture.PrimaryNormal)
                                  : fromHex(GrayScale.White),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 2,
                                color: fromHex(Signiture.PrimaryNormal),
                              )),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                this.route = 'freeze';
                              });
                            },
                            child: Text(
                              'FREEZE',
                              style: TextStyle(
                                fontFamily: "Montserrat_Extrabold",
                                fontSize: 14,
                                color: this.route == 'freeze'
                                    ? fromHex(GrayScale.White)
                                    : fromHex(Signiture.PrimaryNormal),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 30,
                  ),
                  if (_selectedIndex == 0 && this.route == 'photo_map')
                    Container(
                      height: MediaQuery.of(context).size.height - 200,
                      child: Map(),
                    )
                  else if (_selectedIndex == 0 && this.route == 'freeze')
                    Container(
                      height: MediaQuery.of(context).size.height - 200,
                      child: SingleChildScrollView(
                          //to scroll images
                          //TODO

                          child: Image.asset("assets/images/contents.png")),
                    ),
                ],
              ),
        floatingActionButton: Container(
          height: 100.0,
          width: 100.0,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () async {
                try {
                  WidgetsFlutterBinding.ensureInitialized();
                  _cameras = await CameraPlatform.instance.availableCameras();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => FreezeCamera(cameras: _cameras)));
                } on CameraException catch (e) {
                  _logError(e.code, e.description);
                }
                // await availableCameras().then((value) => Navigator.push(context,
                //     MaterialPageRoute(builder: (_) => Freeze(cameras: value))));
              },
              child: Icon(Icons.camera_alt_rounded),
              backgroundColor: fromHex(Signiture.PrimaryNormal),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: SizedBox(
            height: 80,
            child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home, size: 30),
                  label: ' ',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person, size: 30),
                  label: ' ',
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            )));
  }

  void _logError(String code, String? message) {
    // ignore: avoid_print
    print('Error: $code${message == null ? '' : '\nError Message: $message'}');
  }
}
