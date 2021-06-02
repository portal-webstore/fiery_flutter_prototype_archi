import 'package:fiery_flutter_prototype_archi/app/blocs/app_bloc.dart'
    show AppStatus;
import 'package:fiery_flutter_prototype_archi/home/screens/home_screen.dart'
    show HomeScreen;
import 'package:fiery_flutter_prototype_archi/order/create_order_wizard/start_order/screens/start_order_screen.dart'
    show StartOrderScreen;
import 'package:flutter/material.dart';

List<Page> onGenerateAppViewPages(AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomeScreen.page()];
    case AppStatus.unauthenticated:
    default:
      // - FIXME: Remove this testing
      return [
        StartOrderScreen.page(),
        // ReviewHistoricalOrderScreen.page(
        //   argumentsClinicOrderInfo: const ReviewHistoricalOrderScreenArguments(
        //     clinicID: 'TEST',
        //     orderID: 'oFukxMZTtpOaNHRZ0cxs',
        //   ),
        // ),
      ];
  }
}
