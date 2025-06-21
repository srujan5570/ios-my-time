import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  private var castarSDKHandler: CastarSDKHandler?
  
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    
    // Initialize CastarSDK handler
    castarSDKHandler = CastarSDKHandler()
    if let controller = window?.rootViewController as? FlutterViewController {
      castarSDKHandler?.setupMethodChannel(messenger: controller.binaryMessenger)
    }
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
