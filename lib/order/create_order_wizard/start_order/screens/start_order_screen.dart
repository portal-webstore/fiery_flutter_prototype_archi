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
