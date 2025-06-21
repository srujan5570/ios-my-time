import Flutter
import UIKit
import CastarSDK

@main
@objc class AppDelegate: FlutterAppDelegate {
  var castarInstance: Castar?
  private var methodChannel: FlutterMethodChannel?
  
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    
    // Setup method channel for CastarSDK
    let controller = window?.rootViewController as! FlutterViewController
    methodChannel = FlutterMethodChannel(name: "castar_sdk_channel", binaryMessenger: controller.binaryMessenger)
    
    methodChannel?.setMethodCallHandler { [weak self] (call, result) in
      self?.handleMethodCall(call, result: result)
    }
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  
  private func handleMethodCall(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "initializeCastarSDK":
      if let args = call.arguments as? [String: Any],
         let clientId = args["clientId"] as? String {
        let success = initializeCastarSDK(clientId: clientId)
        result(success)
      } else {
        result(FlutterError(code: "INVALID_ARGUMENTS", message: "Client ID is required", details: nil))
      }
      
    case "startCastarSDK":
      startCastarSDK()
      result(true)
      
    case "stopCastarSDK":
      stopCastarSDK()
      result(true)
      
    default:
      result(FlutterMethodNotImplemented)
    }
  }
  
  // Method to initialize CastarSDK with client ID
  func initializeCastarSDK(clientId: String) -> Bool {
    let result = Castar.createInstance(devKey: clientId)
    
    switch result {
    case .success(let instance):
      castarInstance = instance
      return true
    case .failure(let error):
      print("Failed to initialize Castar: \(error.localizedDescription)")
      return false
    }
  }
  
  // Method to start CastarSDK
  func startCastarSDK() {
    castarInstance?.start()
  }
  
  // Method to stop CastarSDK
  func stopCastarSDK() {
    castarInstance?.stop()
  }
}
