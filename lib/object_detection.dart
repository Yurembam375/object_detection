import 'package:flutter/services.dart';

class ObjectDetectionChannel {
  static const MethodChannel _channel = MethodChannel('object_detection_channel');

  static Future<void> startCamera() async {
    await _channel.invokeMethod('startCamera');
  }

  static Future<void> stopCamera() async {
    await _channel.invokeMethod('stopCamera');
  }

  static Future<void> detectObjects() async {
    await _channel.invokeMethod('detectObjects');
  }
}
