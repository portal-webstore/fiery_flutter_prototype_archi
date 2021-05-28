import 'package:fiery_flutter_prototype_archi/shared/drawer/drawer.dart'
    show SideMenuNavigationDrawer;
import 'package:flutter/material.dart';

class ReviewCompleteSaveSubmitScreen extends StatefulWidget {
  const ReviewCompleteSaveSubmitScreen({
    Key? key,
  }) : super(key: key);

  static const title = 'Review confirmation';

  static Page page() =>
      const MaterialPage<void>(child: ReviewCompleteSaveSubmitScreen());

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const ReviewCompleteSaveSubmitScreen(),
    );
  }

  @override
  _ReviewCompleteSaveSubmitScreenState createState() =>
      _ReviewCompleteSaveSubmitScreenState();
}

class _ReviewCompleteSaveSubmitScreenState
    extends State<ReviewCompleteSaveSubmitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(ReviewCompleteSaveSubmitScreen.title),
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
