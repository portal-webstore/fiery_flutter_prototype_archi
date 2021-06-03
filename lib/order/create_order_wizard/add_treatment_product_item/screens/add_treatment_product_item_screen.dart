import 'package:fiery_flutter_prototype_archi/order/atoms/padding.dart';
import 'package:fiery_flutter_prototype_archi/order/create_order_wizard/add_treatment_product_item/forms/add_treatment_product_item_form.dart';
import 'package:fiery_flutter_prototype_archi/shared/drawer/drawer.dart'
    show SideMenuNavigationDrawer;
import 'package:flutter/material.dart';

/// Add treatment product item to the intended patient within the order
/// More than one may be added
/// i.e. close each one on saving item
/// Minimise editability depending on drafting complexity.
///
/// Draft: ? Remove patient, add patient. Deter granular editing feature.
class OrderAddTreatmentProductItemScreen extends StatefulWidget {
  const OrderAddTreatmentProductItemScreen({
    Key? key,
  }) : super(key: key);

  static const title = 'Add treatment product for patient';

  static Page page() =>
      const MaterialPage<void>(child: OrderAddTreatmentProductItemScreen());

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const OrderAddTreatmentProductItemScreen(),
    );
  }

  @override
  _OrderAddTreatmentProductItemScreenState createState() =>
      _OrderAddTreatmentProductItemScreenState();
}

class _OrderAddTreatmentProductItemScreenState
    extends State<OrderAddTreatmentProductItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(OrderAddTreatmentProductItemScreen.title),
        actions: const <Widget>[],
      ),
      drawer: const SideMenuNavigationDrawer(),
      body: const SingleChildScrollView(
        padding: edgeInsetsPadding,
        child: AddTreatmentProductItemForm(),
      ),
    );
  }
}
