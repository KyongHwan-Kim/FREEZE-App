import 'dart:async';

import 'package:flutter/material.dart';
import 'package:freeze/models/color.dart';
import 'package:freeze/utilities/utility.dart';
import 'package:get/get.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class Map extends StatefulWidget {
  const Map({Key key}) : super(key: key);

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
    return NaverMap(
      onMapCreated: this.onMapCreated,
      mapType: _mapType,
      locationButtonEnable: true,
    );
  }
}
