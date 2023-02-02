import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freeze_new/models/color.dart';
import 'package:freeze_new/utilities/utility.dart';
import 'package:get/get.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  Completer<NaverMapController> _controller = Completer();
  MapType _mapType = MapType.Basic;
  LocationTrackingMode _trackingMode = LocationTrackingMode.NoFollow;

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
          initialCameraPosition:
              CameraPosition(target: LatLng(37.566570, 126.978442), zoom: 17),
          onMapCreated: onMapCreated,
          initLocationTrackingMode: _trackingMode,
          mapType: _mapType,
          locationButtonEnable: true,
          onCameraChange: _onCameraChange,
          onCameraIdle: _onCameraIdle,
          onMapTap: _onMapTap,
          onMapLongTap: _onMapLongTap,
          onMapDoubleTap: _onMapDoubleTap,
          onMapTwoFingerTap: _onMapTwoFingerTap,
          onSymbolTap: _onSymbolTap,
          maxZoom: 17,
          minZoom: 12,
          useSurface: kReleaseMode,
          logoClickEnabled: true,
          indoorEnable: true,
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

  _onMapTap(LatLng position) async {
    await (await _controller.future).moveCamera(
        CameraUpdate.toCameraPosition(CameraPosition(target: position)),
        animationDuration: 1500);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content:
          Text('[onTap] lat: ${position.latitude}, lon: ${position.longitude}'),
      duration: Duration(milliseconds: 500),
      backgroundColor: Colors.black,
    ));
  }

  _onMapLongTap(LatLng position) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
          '[onLongTap] lat: ${position.latitude}, lon: ${position.longitude}'),
      duration: Duration(milliseconds: 500),
      backgroundColor: Colors.black,
    ));
  }

  _onMapDoubleTap(LatLng position) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
          '[onDoubleTap] lat: ${position.latitude}, lon: ${position.longitude}'),
      duration: Duration(milliseconds: 500),
      backgroundColor: Colors.black,
    ));
  }

  _onMapTwoFingerTap(LatLng position) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
          '[onTwoFingerTap] lat: ${position.latitude}, lon: ${position.longitude}'),
      duration: Duration(milliseconds: 500),
      backgroundColor: Colors.black,
    ));
  }

  _onSymbolTap(LatLng? position, String? caption) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
          '[onSymbolTap] caption: $caption, lat: ${position?.latitude}, lon: ${position?.longitude}'),
      duration: Duration(milliseconds: 500),
      backgroundColor: Colors.black,
    ));
  }

  _mapTypeSelector() {
    return SizedBox(
      height: kToolbarHeight,
      child: ListView.separated(
        itemCount: MapType.values.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => SizedBox(width: 16),
        itemBuilder: (_, index) {
          final type = MapType.values[index];
          String title;
          switch (type) {
            case MapType.Basic:
              title = '기본';
              break;
            case MapType.Navi:
              title = '내비';
              break;
            case MapType.Satellite:
              title = '위성';
              break;
            case MapType.Hybrid:
              title = '위성혼합';
              break;
            case MapType.Terrain:
              title = '지형도';
              break;
          }

          return GestureDetector(
            onTap: () => _onTapTypeSelector(type),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 3)]),
              margin: EdgeInsets.only(bottom: 16),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                    fontSize: 13),
              ),
            ),
          );
        },
      ),
    );
  }

  _trackingModeSelector() {
    return Align(
      alignment: Alignment.bottomRight,
      child: GestureDetector(
        onTap: _onTapTakeSnapShot,
        child: Container(
          margin: EdgeInsets.only(right: 16, bottom: 48),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 2,
                )
              ]),
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.photo_camera,
                color: Colors.black54,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 지도 유형 선택시
  void _onTapTypeSelector(MapType type) async {
    if (_mapType != type) {
      setState(() {
        _mapType = type;
      });
    }
  }

  /// my location button
  // void _onTapLocation() async {
  //   final controller = await _controller.future;
  //   controller.setLocationTrackingMode(LocationTrackingMode.Follow);
  // }

  void _onCameraChange(
      LatLng? latLng, CameraChangeReason reason, bool? isAnimated) {
    print('카메라 움직임 >>> 위치 : ${latLng?.latitude}, ${latLng?.longitude}'
        '\n원인: $reason'
        '\n에니메이션 여부: $isAnimated');
  }

  void _onCameraIdle() {
    print('카메라 움직임 멈춤');
  }

  /// 지도 스냅샷
  void _onTapTakeSnapShot() async {
    final controller = await _controller.future;
    controller.takeSnapshot((path) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              contentPadding: EdgeInsets.zero,
              content: path != null
                  ? Image.file(
                      File(path),
                    )
                  : Text('path is null!'),
              titlePadding: EdgeInsets.zero,
            );
          });
    });
  }
}
