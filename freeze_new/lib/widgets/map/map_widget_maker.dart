import 'package:flutter/material.dart';

class MapWidgetMaker extends StatefulWidget {
  const MapWidgetMaker({Key? key}) : super(key: key);

  @override
  _MapWidgetMakerState createState() => _MapWidgetMakerState();
}

class _MapWidgetMakerState extends State<MapWidgetMaker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text('테스트'),
    );
  }
}
