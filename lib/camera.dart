import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

List<CameraDescription> cameras;

class CameraApp extends StatefulWidget {
  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.ultraHigh);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  @override
  void dispose() {
    // TODO: implement dispose
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (!controller.value.isInitialized) {
      return Container();
    }

    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: CameraPreview(controller),
    );
  }
}