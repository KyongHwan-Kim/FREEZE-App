import 'package:flutter/material.dart';
import 'package:freeze_new/screens/camera/guide/tilt_guide.dart';

class Header extends StatelessWidget {
  Header(
      {Key? key,
      required this.onCameraSwitch,
      required this.onGridGuide,
      required this.defaultTilt,
      this.exif})
      : super(key: key);

  final VoidCallback onCameraSwitch;
  final VoidCallback onGridGuide;
  final double defaultTilt;
  final Map? exif;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
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
                        onPressed: () => onGridGuide(),
                        child: Icon(Icons.grid_on)),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    child: TextButton(
                        onPressed: () => onCameraSwitch(),
                        child: const Icon(Icons.flip_camera_ios_rounded)),
                  ),
                ],
              ),
              TiltGuide(defaultTilt: defaultTilt, exif: exif),
            ]),
          )
        ]);
  }
}
