import 'dart:convert' show jsonDecode;

import 'package:fiery_flutter_prototype_archi/shared/app_info/mixins/package_infoable_mixin.dart'
    show PackageInfoableMixin;
import 'package:fiery_flutter_prototype_archi/shared/app_info/models/app_info_model.dart'
    show AppInfo;
import 'package:package_info_plus/package_info_plus.dart' show PackageInfo;

class AppPackageInfo extends AppInfo with PackageInfoableMixin {
  const AppPackageInfo({
    required String appName,
    required String buildNumber,
    required String packageName,
    required String version,
  }) : super(
          appName: appName,
          buildNumber: buildNumber,
          packageName: packageName,
          version: version,
        );
  factory AppPackageInfo.fromPackageInfo(
    PackageInfo packageInfo,
  ) {
    return PackageInfoableMixin.getAppInfoFromPackageInfo(packageInfo);
  }

  factory AppPackageInfo.fromMap(Map<String, dynamic> map) {
    return AppPackageInfo(
      appName: map['appName'] as String? ?? '',
      buildNumber: map['buildNumber'] as String? ?? '',
      packageName: map['packageName'] as String? ?? '',
      version: map['version'] as String? ?? '',
    );
  }

  factory AppPackageInfo.fromJson(String source) => AppPackageInfo.fromMap(
        jsonDecode(source) as Map<String, dynamic>,
      );
}
