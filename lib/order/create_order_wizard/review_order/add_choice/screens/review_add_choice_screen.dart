import 'package:fiery_flutter_prototype_archi/shared/drawer/drawer.dart'
    show SideMenuNavigationDrawer;
import 'package:flutter/material.dart';

/// Button decision model based on priority
///
/// 1. Add another drug to the same patient
/// 2. Add another patient to the same order
/// 3. Review / submit (or save draft for resumption later)
///
/// Could show the current patient here as well to facilitate adding another
/// drug on the first review choice.
///
class ReviewAddChoiceScreen extends StatefulWidget {
  const ReviewAddChoiceScreen({
    Key? key,
  }) : super(key: key);

  static const title = 'Review order addition';

  static Page page() =>
      const MaterialPage<void>(child: ReviewAddChoiceScreen());

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const ReviewAddChoiceScreen(),
    );
  }

  @override
  _ReviewAddChoiceScreenState createState() => _ReviewAddChoiceScreenState();
}

class _ReviewAddChoiceScreenState extends State<ReviewAddChoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(ReviewAddChoiceScreen.title),
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
