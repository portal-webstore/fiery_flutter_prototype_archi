import 'package:fiery_flutter_prototype_archi/shared/drawer/drawer.dart'
    show SideMenuNavigationDrawer;
import 'package:flutter/material.dart';

class CreateOrderScreen extends StatefulWidget {
  const CreateOrderScreen({
    Key? key,
  }) : super(key: key);

  static const title = 'Create order';

  static Page page() => const MaterialPage<void>(child: CreateOrderScreen());

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const CreateOrderScreen(),
    );
  }

  @override
  _CreateOrderScreenState createState() => _CreateOrderScreenState();
}

class _CreateOrderScreenState extends State<CreateOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(CreateOrderScreen.title),
        actions: const <Widget>[],
      ),
      drawer: const SideMenuNavigationDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            SizedBox(height: 4.0),
          ],
        ),
      ),
    );
  }
}
