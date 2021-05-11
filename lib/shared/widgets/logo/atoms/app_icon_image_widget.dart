import 'package:flutter/material.dart';

class AppIconImageWidget extends StatelessWidget {
  const AppIconImageWidget({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    // Calculating container width along axis
    final double imageSize =
        getIconImageSizeHeightOrientedByAxis(context, screenSize);

    return Image.asset(
      image,
      height: imageSize,
    );
  }

  /// Get the "height" depending on the orientation (portrait vs landscape)
  /// Not sure why sample was coded like this.
  ///
  /// Bug-for-bug with slight refactoring.
  ///
  /// If portrait, the icon "height" is a percentage derived from screen width
  /// If landscape, the icon height is a percentage derived from screen height
  ///
  ///
  /// We should probably be able to access another platform attribute with
  /// builtin libraries. Flutter 2
  ///
  /// MediaQuery is still largely used in documentation and existing projects,
  /// though
  double getIconImageSizeHeightOrientedByAxis(
    BuildContext context,
    Size screenSize,
  ) {
    // Calculating container width along axis
    // ? What about 0.2.sw 0.2.sh? flutter_screenutil extension
    const double twentyPercentProportionalAppIconSize = 0.20;

    final Orientation screenOrientation = MediaQuery.of(context).orientation;
    final isScreenPortrait = screenOrientation == Orientation.portrait;

    // Maybe flutter preserves one as height and not the other
    // When a screen could potentially rotate orientation between rebuilds
    // ? /shrug
    if (isScreenPortrait) {
      return screenSize.width * twentyPercentProportionalAppIconSize;
    } else {
      return screenSize.height * twentyPercentProportionalAppIconSize;
    }
  }
}
