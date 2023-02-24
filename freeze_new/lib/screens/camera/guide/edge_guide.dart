import 'package:flutter/material.dart';

class EdgeGuide extends StatefulWidget {
  const EdgeGuide({Key? key, this.edgeOpacity, this.edgePath})
      : super(key: key);
  final double? edgeOpacity;
  final String? edgePath;
  @override
  _EdgeGuideState createState() => _EdgeGuideState();
}

class _EdgeGuideState extends State<EdgeGuide> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.8 / 0.8,
      child: Image.asset(
        widget.edgePath!,
        fit: BoxFit.cover,
        opacity: AlwaysStoppedAnimation(widget.edgeOpacity!),
      ),
    );
  }
}
