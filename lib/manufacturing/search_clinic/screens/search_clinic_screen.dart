import 'package:fiery_flutter_prototype_archi/shared/drawer/drawer.dart'
    show SideMenuNavigationDrawer;
import 'package:flutter/material.dart';

/// To search dropdown first
/// Then reuse the same order history screen as clinic??
/// Or recompose so we use separate admin tile for checking the items listed
/// i.e. like todos tick checkmark auto saves to firestore.

class SearchClinicScreen extends StatefulWidget {
  const SearchClinicScreen({
    Key? key,
  }) : super(key: key);

  static const title = 'Search clinics order histories';

  static Page page() => const MaterialPage<void>(child: SearchClinicScreen());

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const SearchClinicScreen(),
    );
  }

  @override
  _SearchClinicScreenState createState() => _SearchClinicScreenState();
}

class _SearchClinicScreenState extends State<SearchClinicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(SearchClinicScreen.title),
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
