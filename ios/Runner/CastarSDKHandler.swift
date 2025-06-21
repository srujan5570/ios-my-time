import Foundation
import Flutter
import CastarSDK

class CastarSDKHandler: NSObject {
    private var castarInstance: Castar?
    private var methodChannel: FlutterMethodChannel?
    
    func setupMethodChannel(messenger: FlutterBinaryMessenger) {
        methodChannel = FlutterMethodChannel(name: "castar_sdk", binaryMessenger: messenger)
        methodChannel?.setMethodCallHandler { [weak self] (call, result) in
            self?.handleMethodCall(call, result: result)
        }
    }
    
    private func handleMethodCall(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "initialize":
            handleInitialize(call, result: result)
        case "start":
            handleStart(result: result)
        case "stop":
            handleStop(result: result)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    private func handleInitialize(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        guard let args = call.arguments as? [String: Any],
              let clientId = args["clientId"] as? String else {
            result(false)
            return
        }
        
        // Create Castar instance
        let castarResult = Castar.createInstance(devKey: clientId)
        
        switch castarResult {
        case .success(let instance):
            castarInstance = instance
            result(true)
        case .failure(let error):
            print("Failed to initialize Castar: \(error.localizedDescription)")
            result(false)
        }
    }
    
    private func handleStart(result: @escaping FlutterResult) {
        guard let instance = castarInstance else {
            result(false)
            return
        }
        
        instance.start()
        result(true)
    }
    
    private func handleStop(result: @escaping FlutterResult) {
        guard let instance = castarInstance else {
            result(false)
            return
        }
        
        instance.stop()
        result(true)
    }
} 