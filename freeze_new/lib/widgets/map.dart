import 'dart:async';

import 'package:flutter/material.dart';
import 'package:freeze_new/models/color.dart';
import 'package:freeze_new/utilities/utility.dart';
import 'package:get/get.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  Completer<NaverMapController> _controller = Completer();
  MapType _mapType = MapType.Basic;

  void onMapCreated(NaverMapController controller) {
    if (_controller.isCompleted) _controller = Completer();
    _controller.complete(controller);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        NaverMap(
          onMapCreated: onMapCreated,
          mapType: _mapType,
          locationButtonEnable: true,
        ),
        Positioned(
          top: 20,
          child: Container(
              height: 65,
              width: 400,
              decoration: BoxDecoration(
                  color: fromHex(GrayScale.White),
                  borderRadius: BorderRadius.circular(50)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 10,
                  ),
                  Icon(Icons.search, color: fromHex(GrayScale.C_43)),
                  SizedBox(
                    width: 280,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: '멋진 사진을 어디서 남기고 싶으신가요?',
                        hintStyle: TextStyle(
                            fontFamily: 'NotoSansKR_Medium',
                            fontSize: 12,
                            color: Colors.grey),
                      ),
                    ),
                  ),
                  Icon(Icons.filter_list, color: fromHex(GrayScale.C_43)),
                  Container(
                    width: 10,
                  ),
                ],
              )),
        ),
        SlidingUpPanel(
          parallaxEnabled: true,
          parallaxOffset: .5,
          maxHeight: 350,
          panelBuilder: (sc) => MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView(controller: sc, children: [
              SizedBox(
                height: 12.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 30,
                    height: 5,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.all(Radius.circular(12.0))),
                  ),
                ],
              ),
              SizedBox(
                height: 18.0,
              ),
              Image.asset(
                "assets/images/Box_Image.png",
                width: MediaQuery.of(context).size.width - 40,
              ),
            ]),
          ),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18.0), topRight: Radius.circular(18.0)),
        ),
      ],
    );
  }
}
