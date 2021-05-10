import 'package:fiery_flutter_prototype_archi/home/keys/home_keys.dart';
import 'package:fiery_flutter_prototype_archi/shared/widgets/atoms/atoms.dart'
    show WebstoreLogo;
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
    this.title,
  }) : super(key: key);

  static const Key menuKey = HomeKeys.menuKey;

  final String? title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      // - TODO: Add drawer for side menu navigation fallback

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Home',
            ),
            IconButton(
              icon: WebstoreLogo(),
              onPressed: null,
            ),
            IconButton(
              key: HomeScreen.menuKey,
              icon: Icon(
                Icons.menu,
              ),
              onPressed: null,
            )
          ],
        ),
      ),
    );
  }
}
