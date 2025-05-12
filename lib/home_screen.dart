import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:object_detection_native/object_detection.dart';

class ObjectDetectionPage extends StatefulWidget {
  const ObjectDetectionPage({super.key});

  @override
  _ObjectDetectionPageState createState() => _ObjectDetectionPageState();
}

class _ObjectDetectionPageState extends State<ObjectDetectionPage> {
  @override
  void initState() {
    super.initState();
    checkCameraPermission();  // Check camera permission
    ObjectDetectionChannel.startCamera();
  }

  // Function to check and request camera permission
  void checkCameraPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      // Request permission if not granted
      await Permission.camera.request();
    }
  }

  @override
  void dispose() {
    ObjectDetectionChannel.stopCamera();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Native Object Detection'),
      ),
      body: const Center(
        child: Text('Camera preview will be displayed here.'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ObjectDetectionChannel.detectObjects();
        },
        child: const Icon(Icons.camera),
      ),
    );
  }
}
