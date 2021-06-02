import 'package:fiery_flutter_prototype_archi/order/atoms/padding.dart'
    show edgeInsetsPadding;
import 'package:fiery_flutter_prototype_archi/order/create_order_wizard/start_order/forms/start_order_form.dart'
    show StartOrderForm;
import 'package:fiery_flutter_prototype_archi/shared/drawer/drawer.dart'
    show SideMenuNavigationDrawer;
import 'package:flutter/material.dart';

class StartOrderScreen extends StatefulWidget {
  const StartOrderScreen({
    Key? key,
  }) : super(key: key);

  static const title = 'Create order';

  static Page page() => const MaterialPage<void>(child: StartOrderScreen());

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const StartOrderScreen(),
    );
  }

  @override
  _StartOrderScreenState createState() => _StartOrderScreenState();
}

class _StartOrderScreenState extends State<StartOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StartOrderScreen.title),
        actions: const <Widget>[],
      ),
      drawer: const SideMenuNavigationDrawer(),
      body: const SingleChildScrollView(
        padding: edgeInsetsPadding,
        child: StartOrderForm(),
      ),
    );
  }
}
