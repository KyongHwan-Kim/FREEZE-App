import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

List<CameraDescription> cameras;

class Freeze extends StatefulWidget {
  const Freeze({Key key}) : super(key: key);

  @override
  _FreezeState createState() => _FreezeState();
}

class _FreezeState extends State<Freeze> {
  List<CameraDescription> cameras;
  CameraController controller;
  bool isReady = false;

  @override
  void initState() {
    super.initState();
    setupCameras();
  }

  Future<void> setupCameras() async {
    try {
      cameras = await availableCameras();
      controller = new CameraController(cameras[0], ResolutionPreset.medium);
      await controller.initialize();
    } on CameraException catch (_) {
      setState(() {
        isReady = false;
      });
    }
    setState(() {
      isReady = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  child: TextButton(
                      onPressed: () {}, child: Icon(Icons.arrow_back)),
                ),
                Container(
                  height: 40,
                  width: 40,
                  child: TextButton(
                      onPressed: () {}, child: Icon(Icons.fullscreen)),
                ),
                Container(
                  height: 40,
                  width: 40,
                  child:
                      TextButton(onPressed: () {}, child: Icon(Icons.grid_on)),
                ),
                Container(
                  height: 40,
                  width: 40,
                  child: TextButton(
                      onPressed: () {},
                      child: Icon(Icons.flip_camera_ios_rounded)),
                ),
                if (!isReady && !controller.value.isInitialized)
                  Container()
                else
                  AspectRatio(
                      aspectRatio: controller.value.aspectRatio,
                      child: CameraPreview(controller))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
