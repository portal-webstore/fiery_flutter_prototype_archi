import 'package:fiery_flutter_prototype_archi/shared/app_info/models/app_info_model.dart'
    show AppInfo;
import 'package:fiery_flutter_prototype_archi/shared/app_info/view_models/app_package_info_view_model.dart'
    show AppPackageInfo;
import 'package:package_info_plus/package_info_plus.dart' show PackageInfo;

/// Mixins do not have factory constructors
/// mixin PackageInfoable on AppInfo
///
/// Refactoring attempt to decouple reliance on PackageInfo dependency for
/// future flexibility - failed.
///
/// Smelly code thought experiment intended to break out this arbitrary convert
mixin PackageInfoableMixin on AppInfo {
  // ignore: prefer_constructors_over_static_methods
  static AppPackageInfo getAppInfoFromPackageInfo(
    PackageInfo packageInfo,
  ) {
    return AppPackageInfo(
      appName: packageInfo.appName,
      buildNumber: packageInfo.buildNumber,
      packageName: packageInfo.packageName,
      version: packageInfo.version,
    );
  }
}
