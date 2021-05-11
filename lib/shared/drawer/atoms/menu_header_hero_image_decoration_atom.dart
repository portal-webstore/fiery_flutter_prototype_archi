import 'package:fiery_flutter_prototype_archi/shared/assets/constants/assets.dart'
    show Assets;
import 'package:flutter/material.dart';

const menuHeaderHeroImageDecoration = BoxDecoration(
  image: DecorationImage(
    fit: BoxFit.scaleDown,
    image: AssetImage(
      Assets.appLogo,
    ),
  ),
);
