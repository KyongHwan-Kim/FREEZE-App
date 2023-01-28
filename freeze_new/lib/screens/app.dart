import 'package:flutter/material.dart';
import 'package:freeze_new/models/color.dart';
import 'package:freeze_new/screens/route_camera.dart';
import 'package:freeze_new/utilities/utility.dart';
import 'package:freeze_new/widgets/map.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  String route = 'photo_map';

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
            if (this.route == 'photo_map')
              Container(
                height: MediaQuery.of(context).size.height - 180,
                child: Map(),
              )
            else if (this.route == 'freeze')
              Container(
                height: MediaQuery.of(context).size.height - 180,
                child: Text('freeze'),
              ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => RouteCamera()));
          },
          child: Icon(Icons.camera_alt_rounded),
          backgroundColor: fromHex(Signiture.PrimaryNormal),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          notchMargin: 10,
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [],
            ),
          ),
        ));
  }
}
