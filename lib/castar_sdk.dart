import 'package:flutter/services.dart';

class CastarSDK {
  static const MethodChannel _channel = MethodChannel('castar_sdk');

  /// Initialize CastarSDK with client ID
  static Future<bool> initialize(String clientId) async {
    try {
      final bool result = await _channel.invokeMethod('initialize', {
        'clientId': clientId,
      });
      return result;
    } on PlatformException catch (e) {
      print('Failed to initialize CastarSDK: ${e.message}');
      return false;
    }
  }

  /// Start CastarSDK
  static Future<bool> start() async {
    try {
      final bool result = await _channel.invokeMethod('start');
      return result;
    } on PlatformException catch (e) {
      print('Failed to start CastarSDK: ${e.message}');
      return false;
    }
  }

  /// Stop CastarSDK
  static Future<bool> stop() async {
    try {
      final bool result = await _channel.invokeMethod('stop');
      return result;
    } on PlatformException catch (e) {
      print('Failed to stop CastarSDK: ${e.message}');
      return false;
    }
  }
}
