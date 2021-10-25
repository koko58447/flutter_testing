import 'dart:io';
import 'dart:ui';

import 'package:flutter/services.dart';

import 'package:device_info/device_info.dart';
import 'package:http/http.dart' as http;
import 'package:package_info/package_info.dart';

class IpInfoApi {
  static Future<String> getIPAddress() async {
    try {
      final url = Uri.parse('https://api.ipif.org');
      final response = await http.get(url);
      return response.statusCode == 200 ? response.body : '';
    } catch (e) {
      return '';
    }
  }
}

class DeviceInfoApi {
  static final _deviceInfoPlugin = DeviceInfoPlugin();
  static Future<String> getOperationSystem() async => Platform.operatingSystem;
  static Future<String> getScreenResolution() async =>
      '${window.physicalSize.width} X ${window.physicalSize.height}';

  static Future<String> getPhoneInfo() async {
    if (Platform.isAndroid) {
      final info = await _deviceInfoPlugin.androidInfo;
      return '${info.manufacturer} - ${info.model}';
    } else if (Platform.isIOS) {
      final info = await _deviceInfoPlugin.iosInfo;
      return '${info.name} ${info.model}';
    } else {
      throw UnimplementedError();
    }
  }

  static Future<String> getPhoneVersion() async {
    if (Platform.isAndroid) {
      final info = await _deviceInfoPlugin.androidInfo;
      return info.version.sdkInt.toString();
    } else if (Platform.isIOS) {
      final info = await _deviceInfoPlugin.iosInfo;
      return info.systemVersion;
    } else {
      throw UnimplementedError();
    }
  }
}

class PackageInfoApi {
  static Future<String> getPackageName() async {
    final packageinfo = await PackageInfo.fromPlatform();
    return packageinfo.packageName;
  }

  static Future<String> getAppVersion() async {
    final packageinfo = await PackageInfo.fromPlatform();
    return '${packageinfo.version} +${packageinfo.buildNumber}';
  }
}
