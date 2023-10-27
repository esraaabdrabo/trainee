import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info/package_info.dart';

import '../../errors/error_global_handler/platform_type.dart';
import '../../errors/error_global_handler/report.dart';
import 'application_profile_manager.dart';

class CatcherHandler {
  /// Device info
  Map<String, dynamic> _deviceParameters = new Map();

  /// Application info
  Map<String, dynamic> _applicationParameters = new Map();

  static final CatcherHandler _catcherHandler = CatcherHandler._internal();

  factory CatcherHandler() {
    return _catcherHandler;
  }

  CatcherHandler._internal();

  void init() {
    _initHandlers();
  }

  void _initHandlers() {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      deviceInfo.androidInfo.then((androidInfo) {
        _loadAndroidParameters(androidInfo);
      });
    } else {
      deviceInfo.iosInfo.then((iosInfo) {
        _loadIosParameters(iosInfo);
      });
    }

    _loadApplicationInfo();
  }

  void _loadAndroidParameters(AndroidDeviceInfo androidDeviceInfo) {
    _deviceParameters["id"] = androidDeviceInfo.id;
    _deviceParameters["androidId"] = androidDeviceInfo.androidId;
    _deviceParameters["board"] = androidDeviceInfo.board;
    _deviceParameters["bootloader"] = androidDeviceInfo.bootloader;
    _deviceParameters["brand"] = androidDeviceInfo.brand;
    _deviceParameters["device"] = androidDeviceInfo.device;
    _deviceParameters["display"] = androidDeviceInfo.display;
    _deviceParameters["fingerprint"] = androidDeviceInfo.fingerprint;
    _deviceParameters["hardware"] = androidDeviceInfo.hardware;
    _deviceParameters["host"] = androidDeviceInfo.host;
    _deviceParameters["isPhysicalDevice"] = androidDeviceInfo.isPhysicalDevice;
    _deviceParameters["manufacturer"] = androidDeviceInfo.manufacturer;
    _deviceParameters["model"] = androidDeviceInfo.model;
    _deviceParameters["product"] = androidDeviceInfo.product;
    _deviceParameters["tags"] = androidDeviceInfo.tags;
    _deviceParameters["type"] = androidDeviceInfo.type;
    _deviceParameters["versionBaseOs"] = androidDeviceInfo.version.baseOS;
    _deviceParameters["versionCodename"] = androidDeviceInfo.version.codename;
    _deviceParameters["versionIncremental"] =
        androidDeviceInfo.version.incremental;
    _deviceParameters["versionPreviewSdk"] =
        androidDeviceInfo.version.previewSdkInt;
    _deviceParameters["versionRelease"] = androidDeviceInfo.version.release;
    _deviceParameters["versionSdk"] = androidDeviceInfo.version.sdkInt;
    _deviceParameters["versionSecurityPatch"] =
        androidDeviceInfo.version.securityPatch;
  }

  void _loadIosParameters(IosDeviceInfo iosInfo) {
    _deviceParameters["model"] = iosInfo.model;
    _deviceParameters["isPhysicalDevice"] = iosInfo.isPhysicalDevice;
    _deviceParameters["identifierForVendor"] = iosInfo.identifierForVendor;
    _deviceParameters["localizedModel"] = iosInfo.localizedModel;
    _deviceParameters["systemName"] = iosInfo.systemName;
    _deviceParameters["systemVersion"] = iosInfo.systemVersion;
    _deviceParameters["utsnameVersion"] = iosInfo.utsname.version;
    _deviceParameters["utsnameRelease"] = iosInfo.utsname.release;
    _deviceParameters["utsnameMachine"] = iosInfo.utsname.machine;
    _deviceParameters["utsnameSysname"] = iosInfo.utsname.sysname;
  }

  void _loadApplicationInfo() {
    _applicationParameters["environment"] =
        describeEnum(ApplicationProfileManager.getApplicationProfile());

    ///There is no package info web implementation
    if (!ApplicationProfileManager.isWeb()) {
      PackageInfo.fromPlatform().then((packageInfo) {
        _applicationParameters["version"] = packageInfo.version;
        _applicationParameters["appName"] = packageInfo.appName;
        _applicationParameters["buildNumber"] = packageInfo.buildNumber;
        _applicationParameters["packageName"] = packageInfo.packageName;
      });
    }
  }

  PlatformType _getPlatformType() {
    if (ApplicationProfileManager.isWeb()) {
      return PlatformType.Web;
    }
    if (ApplicationProfileManager.isAndroid()) {
      return PlatformType.Android;
    }
    if (ApplicationProfileManager.isIos()) {
      return PlatformType.iOS;
    }
    return PlatformType.Unknown;
  }

  Report? createReport(dynamic error, dynamic stackTrace,
      {FlutterErrorDetails? errorDetails}) {
    if (errorDetails == null) return null;
    Report report = Report(
      error,
      stackTrace,
      DateTime.now(),
      _deviceParameters,
      _applicationParameters,
      errorDetails,
      _getPlatformType(),
    );

    return report;
  }
}
