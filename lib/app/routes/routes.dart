import 'package:fiery_flutter_prototype_archi/account/login/screens/login_screen.dart';
import 'package:fiery_flutter_prototype_archi/app/blocs/app_bloc.dart';
import 'package:fiery_flutter_prototype_archi/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

List<Page> onGenerateAppViewPages(AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomeScreen.page()];
    case AppStatus.unauthenticated:
    default:
      return [LoginScreen.page()];
  }
}
