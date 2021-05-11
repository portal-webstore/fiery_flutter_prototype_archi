import 'package:fiery_flutter_prototype_archi/shared/app_info/view_models/app_package_info_view_model.dart';
import 'package:package_info_plus/package_info_plus.dart' show PackageInfo;

/// Superfluous wrapper for future adaptation
Future<AppPackageInfo> getAppPackageInfoNameVersion() async {
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();
  final AppPackageInfo appPackageInfo = AppPackageInfo.fromPackageInfo(
    packageInfo,
  );

  return appPackageInfo;
}
