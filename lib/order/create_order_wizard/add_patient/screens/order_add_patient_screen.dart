import 'package:fiery_flutter_prototype_archi/order/atoms/padding.dart'
    show edgeInsetsPadding;
import 'package:fiery_flutter_prototype_archi/order/create_order_wizard/add_patient/forms/add_patient_form.dart'
    show AddPatientForm;
import 'package:fiery_flutter_prototype_archi/shared/drawer/drawer.dart'
    show SideMenuNavigationDrawer;
import 'package:flutter/material.dart';

class OrderAddPatientScreen extends StatefulWidget {
  const OrderAddPatientScreen({
    Key? key,
  }) : super(key: key);

  static const title = 'Add patient to order';

  static Page page() =>
      const MaterialPage<void>(child: OrderAddPatientScreen());

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const OrderAddPatientScreen(),
    );
  }

  @override
  _OrderAddPatientScreenState createState() => _OrderAddPatientScreenState();
}

class _OrderAddPatientScreenState extends State<OrderAddPatientScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(OrderAddPatientScreen.title),
        actions: const <Widget>[],
      ),
      drawer: const SideMenuNavigationDrawer(),
      body: const SingleChildScrollView(
        padding: edgeInsetsPadding,
        child: AddPatientForm(),
      ),
    );
  }
}
