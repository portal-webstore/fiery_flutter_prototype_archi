import 'package:fiery_flutter_prototype_archi/shared/assets/constants/assets.dart'
    show Assets;
import 'package:fiery_flutter_prototype_archi/shared/widgets/logo/atoms/app_icon_image_widget.dart'
    show AppIconImageWidget;
import 'package:flutter/material.dart';

class WebstoreLogo extends StatefulWidget {
  const WebstoreLogo({
    Key? key,
  }) : super(key: key);

  @override
  _WebstoreLogoState createState() => _WebstoreLogoState();
}

class _WebstoreLogoState extends State<WebstoreLogo> {
  @override
  Widget build(BuildContext context) {
    return const AppIconImageWidget(
      image: Assets.appLogo,
    );
  }
}
