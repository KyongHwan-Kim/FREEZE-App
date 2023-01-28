import 'dart:async';

import 'package:flutter/material.dart';
import 'package:freeze_new/models/color.dart';
import 'package:freeze_new/utilities/utility.dart';
import 'package:get/get.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

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
      children: [
        NaverMap(
          onMapCreated: onMapCreated,
          mapType: _mapType,
          locationButtonEnable: true,
        ),
        Container(
          width: 450,
          height: 150,
          color: Colors.redAccent,
        ),
        Container(
          width: 350,
          height: 125,
          color: Colors.blueAccent,
        ),
        Container(
          width: 250,
          height: 100,
          color: Colors.cyanAccent,
        ),
        Container(
          width: 150,
          height: 75,
          color: Colors.purpleAccent,
        ),
      ],
    );
  }
}
