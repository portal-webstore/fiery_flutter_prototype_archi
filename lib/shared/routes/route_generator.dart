import 'package:fiery_flutter_prototype_archi/account/login/screens/login_screen.dart'
    show LoginScreen;
import 'package:fiery_flutter_prototype_archi/account/sign_up/screens/sign_up_screen.dart'
    show SignUpScreen;
import 'package:fiery_flutter_prototype_archi/dashboard/screens/dashboard_screen.dart'
    show DashboardScreen;
import 'package:fiery_flutter_prototype_archi/home/screens/home_screen.dart'
    show HomeScreen;
import 'package:fiery_flutter_prototype_archi/manufacturing/search_clinic/screens/search_clinic_screen.dart'
    show SearchClinicScreen;
import 'package:fiery_flutter_prototype_archi/order/create_order_wizard/add_patient/screens/order_add_patient_screen.dart'
    show OrderAddPatientScreen;
import 'package:fiery_flutter_prototype_archi/order/create_order_wizard/add_treatment_product_item/screens/add_treatment_product_item_screen.dart'
    show OrderAddTreatmentProductItemScreen;
import 'package:fiery_flutter_prototype_archi/order/create_order_wizard/review_order/add_choice/screens/review_add_choice_screen.dart'
    show ReviewAddChoiceScreen;
import 'package:fiery_flutter_prototype_archi/order/create_order_wizard/review_order/complete_save_submit/screens/review_complete_save_submit_screen.dart'
    show ReviewCompleteSaveSubmitScreen;
import 'package:fiery_flutter_prototype_archi/order/create_order_wizard/start_order/screens/start_order_screen.dart'
    show StartOrderScreen;
import 'package:fiery_flutter_prototype_archi/order/order_history/screens/order_history_screen.dart'
    show OrderHistoryScreen;
import 'package:fiery_flutter_prototype_archi/order/review_historical_order/screens/review_historical_order_screen.dart'
    show ReviewHistoricalOrderScreen;
import 'package:fiery_flutter_prototype_archi/order/review_historical_order/screens/review_historical_order_screen_arguments.dart'
    show ReviewHistoricalOrderScreenArguments;
import 'package:fiery_flutter_prototype_archi/shared/routes/routes.dart'
    show Routes;
import 'package:flutter/material.dart'
    show BuildContext, MaterialPageRoute, Route, RouteSettings;

/// {@template route_generator}
/// Route generator for dynamic substitution into App instantiation.
/// {@endtemplate}
class RouteGenerator {
  /// Static class namespacing
  const RouteGenerator._();

  static Route getRouteOnGenerate(RouteSettings settings) {
    // ignore: unused_local_variable
    final Object? args = settings.arguments;

    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute<void>(builder: (BuildContext context) {
          return const HomeScreen();
        });
      case Routes.signUp:
        return MaterialPageRoute<void>(builder: (BuildContext context) {
          return const SignUpScreen();
        });
      case Routes.login:
        return MaterialPageRoute<void>(builder: (BuildContext context) {
          return const LoginScreen();
        });
      case Routes.dashboard:
        return MaterialPageRoute<void>(builder: (BuildContext context) {
          return const DashboardScreen();
        });
      case Routes.orderHistory:
        return MaterialPageRoute<void>(builder: (BuildContext context) {
          return const OrderHistoryScreen();
        });
      case Routes.reviewSubmittedHistoricalOrder:

        /// Flutter web route goes through this. and finds null
        /// Null as no data through direct chrome address bar
        // if (args == null) {
        //   throw const FormatException(
        //     'Expected clinic and order ID for details screen',
        //   );
        // }

        // final ReviewHistoricalOrderScreenArguments? reviewOrderArgs =
        //     ReviewHistoricalOrderScreenArguments.tryParse(
        //   args,
        // );

        return MaterialPageRoute<void>(builder: (BuildContext context) {
          const placeholderFailedScreenLoadArgs =
              ReviewHistoricalOrderScreenArguments(
            clinicID: '',
            orderID: '',
          );

          return ReviewHistoricalOrderScreen(
            argumentsClinicOrderInfo: placeholderFailedScreenLoadArgs,
          );
        });

      case Routes.wizardCreateOrder:
        return MaterialPageRoute<void>(builder: (BuildContext context) {
          return const StartOrderScreen();
        });
      case Routes.wizardAddPatient:
        return MaterialPageRoute<void>(builder: (BuildContext context) {
          return const OrderAddPatientScreen();
        });
      case Routes.wizardAddTreatmentProductItem:
        return MaterialPageRoute<void>(builder: (BuildContext context) {
          return const OrderAddTreatmentProductItemScreen();
        });
      case Routes.wizardReviewAddChoice:
        return MaterialPageRoute<void>(builder: (BuildContext context) {
          return const ReviewAddChoiceScreen();
        });
      case Routes.wizardReviewComplete:
        return MaterialPageRoute<void>(builder: (BuildContext context) {
          return const ReviewCompleteSaveSubmitScreen();
        });

      case Routes.searchClinic:
        return MaterialPageRoute<void>(builder: (BuildContext context) {
          return const SearchClinicScreen();
        });

      default:
        return MaterialPageRoute<void>(builder: (BuildContext context) {
          return const HomeScreen();
        });
    }
  }
}
