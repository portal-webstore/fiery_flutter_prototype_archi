import 'package:fiery_flutter_prototype_archi/shared/app_info/loaders/get_app_info_loader.dart';
import 'package:fiery_flutter_prototype_archi/shared/app_info/view_models/app_package_info_view_model.dart'
    show AppPackageInfo;
import 'package:flutter/material.dart'
    show
        AsyncSnapshot,
        BuildContext,
        FutureBuilder,
        Key,
        LinearProgressIndicator,
        StatelessWidget,
        Text,
        Widget;

class FutureBuildAppInfoText extends StatelessWidget {
  const FutureBuildAppInfoText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAppPackageInfoNameVersion(),
      initialData: null,
      builder: _buildAppInfoTextPlaceholderedByLinearProgressIndicator,
    );
  }

  /// Future builder utility check
  ///
  /// Somewhat platform-dependent text
  ///
  /// Use directly like
  /// ```dart
  /// FutureBuilder(
  ///    future: getAppNameVersion(),
  ///    initialData: null,
  ///    builder: buildAppInfoTextPlaceholderedByLinearProgressIndicator,
  ///  ),
  /// ```
  static Widget _buildAppInfoTextPlaceholderedByLinearProgressIndicator(
    BuildContext context,
    AsyncSnapshot<AppPackageInfo?> snapshot,
  ) {
    final bool isDataNullIncomplete = !snapshot.hasData;
    final AppPackageInfo? appPackageInfo = snapshot.data;

    if (isDataNullIncomplete || appPackageInfo == null) {
      return const LinearProgressIndicator();
    }

    final String appInfoMultiLineText = appPackageInfo.getMultiLine();

    return Text(
      appInfoMultiLineText,
    );
  }
}
