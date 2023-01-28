import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class Preview extends StatefulWidget {
  final XFile picture;
  const Preview({Key? key, required this.picture}) : super(key: key);

  @override
  _PreviewState createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
