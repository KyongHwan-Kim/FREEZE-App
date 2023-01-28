import 'package:flutter/material.dart';
import 'package:freeze/data/question.dart';
import 'package:freeze/models/color.dart';
import 'package:freeze/models/img.dart';
import 'package:freeze/screens/camera/edit.dart';
import 'package:freeze/screens/camera/freeze.dart';
import 'package:freeze/screens/camera/self.dart';
import 'package:freeze/utilities/utility.dart';

CameraRouteList _items = new CameraRouteList();

class RouteCamera extends StatefulWidget {
  const RouteCamera({Key key}) : super(key: key);

  @override
  _RouteCameraState createState() => _RouteCameraState();
}

class _RouteCameraState extends State<RouteCamera> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 40,
              ),
              Container(
                child: Image.asset(
                  ImgLocale.IconStar,
                  height: 48,
                ),
              ),
              Container(
                height: 40,
              ),
              Container(
                child: Text(
                  '무얼 하실 건가요?',
                  style: TextStyle(
                      fontFamily: "NotoSans_Bold",
                      fontSize: 20,
                      color: fromHex(GrayScale.Black),
                      decoration: TextDecoration.none),
                ),
              ),
              Container(
                height: 40,
              ),
              Container(
                  child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(8),
                    child: Container(
                      height: 80,
                      width: 200,
                      decoration: BoxDecoration(
                        color: fromHex(GrayScale.White),
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(
                          width: _items.items[0]['selected'] ? 3 : 2,
                          color: !_items.items[0]['selected']
                              ? fromHex(Signiture.PrimaryNormal)
                              : fromHex(GrayScale.C_BF),
                        ),
                      ),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Freeze()));
                        },
                        child: Text(
                          '${_items.items[0]["title"]}',
                          style: TextStyle(
                            fontFamily: "NotoSans_Bold",
                            fontSize: 14,
                            color: fromHex(Signiture.PrimaryNormal),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8),
                    child: Container(
                      height: 80,
                      width: 200,
                      decoration: BoxDecoration(
                        color: fromHex(GrayScale.White),
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(
                          width: _items.items[1]['selected'] ? 3 : 2,
                          color: !_items.items[1]['selected']
                              ? fromHex(Signiture.PrimaryNormal)
                              : fromHex(GrayScale.C_BF),
                        ),
                      ),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Self()));
                        },
                        child: Text(
                          '${_items.items[1]["title"]}',
                          style: TextStyle(
                            fontFamily: "NotoSans_Bold",
                            fontSize: 14,
                            color: fromHex(Signiture.PrimaryNormal),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8),
                    child: Container(
                      height: 80,
                      width: 200,
                      decoration: BoxDecoration(
                        color: fromHex(GrayScale.White),
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(
                          width: _items.items[2]['selected'] ? 3 : 2,
                          color: !_items.items[2]['selected']
                              ? fromHex(Signiture.PrimaryNormal)
                              : fromHex(GrayScale.C_BF),
                        ),
                      ),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Edit()));
                        },
                        child: Text(
                          '${_items.items[2]["title"]}',
                          style: TextStyle(
                            fontFamily: "NotoSans_Bold",
                            fontSize: 14,
                            color: fromHex(Signiture.PrimaryNormal),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ))
            ]));
  }
}
