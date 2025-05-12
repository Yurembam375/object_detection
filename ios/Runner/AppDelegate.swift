import Flutter
import UIKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  private let channelName = "object_detection_channel"

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
    
    let objectDetectionChannel = FlutterMethodChannel(
      name: channelName,
      binaryMessenger: controller.binaryMessenger
    )

    objectDetectionChannel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
      switch call.method {
      case "startCamera":
        // TODO: Add camera start logic here
        print("iOS: startCamera called")
        result(nil)
      case "stopCamera":
        // TODO: Add camera stop logic here
        print("iOS: stopCamera called")
        result(nil)
      case "detectObjects":
        // TODO: Add object detection logic here
        print("iOS: detectObjects called")
        result(nil)
      default:
        result(FlutterMethodNotImplemented)
      }
    }

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
