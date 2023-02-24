import 'package:flutter/material.dart';
import 'package:freeze_new/models/font.dart';
import 'package:freeze_new/screens/camera/get_guide.dart';

class BottomNav extends StatefulWidget {
  final void Function(double) setEdgeOpacity;
  final void Function(bool) onEdgeGuide;
  final void Function(bool) ontakePicture;
  Map? guide;
  BottomNav(
      {Key? key,
      this.guide,
      required this.onEdgeGuide,
      required this.setEdgeOpacity,
      required this.ontakePicture})
      : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  bool isEdgeGuideOn = false;
  double edgeGuideOpacity = 0.5;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isEdgeGuideOn
            ? Slider(
                value: edgeGuideOpacity,
                min: 0,
                max: 1,
                // divisions: 5,
                label: "label",
                onChanged: (newValue) {
                  edgeGuideOpacity = newValue;
                  widget.setEdgeOpacity(edgeGuideOpacity);
                },
              )
            : Container(
                height: 48,
              ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => GetGuide()));
                },
                child: Icon(Icons.upload_rounded),
              ),
              const Text(
                "가져오기",
                style: FontKoMgr.Overline,
              )
            ]),
            GestureDetector(
              onTap: () {
                widget.ontakePicture(true);
              }, // Image tapped
              child: Image.asset(
                'assets/images/icon/BTN_camera.png',
                fit: BoxFit.cover, // Fixes border issues
                width: 80.0,
                height: 80.0,
              ),
            ),
            widget.guide == null
                ? Container(
                    width: 68,
                    height: 53,
                  )
                : Container(
                    child: Column(children: [
                      SizedBox(
                        width: 68,
                        height: 53,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Switch(
                            value: isEdgeGuideOn,
                            onChanged: (value) {
                              isEdgeGuideOn = !isEdgeGuideOn;
                              widget.onEdgeGuide(isEdgeGuideOn);
                            },
                          ),
                        ),
                      ),
                      Text(
                        "가이드 켜기",
                        style: FontKoMgr.Overline,
                      ),
                    ]),
                  ),
          ],
        ),
        Container(
          height: 20,
        )
      ],
    );
  }
}