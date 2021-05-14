import 'package:fiery_flutter_prototype_archi/shared/assets/constants/assets.dart'
    show Assets;
import 'package:flutter/material.dart'
    show BuildContext, Image, Key, StatelessWidget, Widget;

class AppLogoImageBanner extends StatelessWidget {
  const AppLogoImageBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.appLogo,
      height: 120,
    );
  }
}
