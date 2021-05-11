import 'dart:convert' show jsonDecode, jsonEncode;

import 'package:equatable/equatable.dart' show Equatable;

/// Attempt to use this as abstract class
/// however, want to reuse the factory constructor convertors~
class AppInfo extends Equatable {
  const AppInfo({
    required this.appName,
    required this.buildNumber,
    required this.packageName,
    required this.version,
  });

  factory AppInfo.fromMap(Map<String, dynamic> map) {
    return AppInfo(
      appName: map['appName'] as String? ?? '',
      buildNumber: map['buildNumber'] as String? ?? '',
      packageName: map['packageName'] as String? ?? '',
      version: map['version'] as String? ?? '',
    );
  }

  factory AppInfo.fromJson(String source) => AppInfo.fromMap(
        jsonDecode(source) as Map<String, dynamic>,
      );

  final String appName;

  /// May not be present for web
  final String buildNumber;

  /// May not be present for web
  final String packageName;
  final String version;

  AppInfo copyWith({
    String? appName,
    String? buildNumber,
    String? packageName,
    String? version,
  }) {
    return AppInfo(
      appName: appName ?? this.appName,
      buildNumber: buildNumber ?? this.buildNumber,
      packageName: packageName ?? this.packageName,
      version: version ?? this.version,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'appName': appName,
      'buildNumber': buildNumber,
      'packageName': packageName,
      'version': version,
    };
  }

  String toJson() => jsonEncode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [appName, buildNumber, packageName, version];

  static String getAppName(String appName) => 'App: $appName \n';

  static String getAppVersion(String version) => 'Version: v$version \n';

  /// No Flutter web build number
  /// Omit extra line that would otherwise be blank
  static String getAppBuildNumberBlanked(String buildNumber) =>
      buildNumber != '' ? 'Build: $buildNumber \n' : '';

  /// No Flutter web package name
  /// Omit extra line that would otherwise be blank
  static String getAppPackageNameBlanked(String packageName) =>
      packageName != '' ? 'Package: $packageName' : '';

  /// Formatted display new lines
  ///
  /// Platform-dependent.
  ///
  /// Conditionally check for platforms that do not have additional package info
  ///
  /// Only display relevant information
  static String getMultiLineText(
    AppInfo appInfo,
  ) {
    final String appName = appInfo.appName;
    final String version = appInfo.version;
    final String buildNumber = appInfo.buildNumber;
    final String packageName = appInfo.packageName;

    // Flutter web, apps cross-platform info
    final appNameText = getAppName(appName);
    final versionNameText = getAppVersion(version);

    // Flutter mobile, maybe desktop has build and package info.
    // Flutter web does not have build or package info
    // Blank out line and new lines entirely if not present.
    final buildNumberText = getAppBuildNumberBlanked(buildNumber);
    final packageNameText = getAppPackageNameBlanked(packageName);

    return appNameText + versionNameText + buildNumberText + packageNameText;
  }

  String getMultiLine() {
    return getMultiLineText(this);
  }
}
