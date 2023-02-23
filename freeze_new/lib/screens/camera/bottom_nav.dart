import 'package:flutter/material.dart';
import 'package:freeze_new/models/font.dart';
import 'package:freeze_new/screens/camera/get_guide.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  bool isEdgeGuideOn = false;
  double edgeGuideOpacity = 0;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Container(
        child: Column(children: [
          TextButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => GetGuide()));
            },
            child: Icon(Icons.upload_rounded),
          ),
          Text(
            "가져오기",
            style: FontKoMgr.Overline,
          )
        ]),
      ),
      GestureDetector(
        onTap: () {
          // takePicture();
        }, // Image tapped
        child: Image.asset(
          'assets/images/icon/BTN_camera.png',
          fit: BoxFit.cover, // Fixes border issues
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
    ]);
  }
}
