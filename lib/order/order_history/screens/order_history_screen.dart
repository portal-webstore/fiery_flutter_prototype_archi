import 'package:fiery_flutter_prototype_archi/shared/drawer/drawer.dart'
    show SideMenuNavigationDrawer;
import 'package:flutter/material.dart';

/// Search sort by order ref "number" free text and date
/// Minimal retention required (i.e. 4 weeks to be safe)
/// Pre query by status - potentially setting arguemtn from the recent
/// orders home dashboard tiles
///
///
///
class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({
    Key? key,
  }) : super(key: key);

  static const title = 'Order history';

  static Page page() => const MaterialPage<void>(child: OrderHistoryScreen());

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const OrderHistoryScreen(),
    );
  }

  @override
  _OrderHistoryScreenState createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(OrderHistoryScreen.title),
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
