import 'package:fiery_flutter_prototype_archi/app/blocs/app_bloc.dart';
import 'package:fiery_flutter_prototype_archi/home/screens/home_screen.dart';
import 'package:fiery_flutter_prototype_archi/order/review_historical_order/screens/review_historical_order_screen.dart'
    show ReviewHistoricalOrderScreen;
import 'package:fiery_flutter_prototype_archi/order/review_historical_order/screens/review_historical_order_screen_arguments.dart'
    show ReviewHistoricalOrderScreenArguments;
import 'package:flutter/material.dart';

List<Page> onGenerateAppViewPages(AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomeScreen.page()];
    case AppStatus.unauthenticated:
    default:
      // - FIXME: Remove this testing
      return [
        ReviewHistoricalOrderScreen.page(
          argumentsClinicOrderInfo: const ReviewHistoricalOrderScreenArguments(
            clinicID: 'TEST',
            orderID: 'oFukxMZTtpOaNHRZ0cxs',
          ),
        )
      ];
  }
}
