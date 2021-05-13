import 'package:fiery_flutter_prototype_archi/app/blocs/app_bloc.dart'
    show AppBloc, AppLogoutRequested;
import 'package:fiery_flutter_prototype_archi/home/keys/home_keys.dart'
    show HomeKeys;
import 'package:fiery_flutter_prototype_archi/shared/widgets/logo/atoms/atoms.dart'
    show WebstoreLogo;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show ReadContext;

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
    this.title,
  }) : super(key: key);

  static const Key menuKey = HomeKeys.menuKey;

  static Page page() => const MaterialPage<void>(child: HomeScreen());

  final String? title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? 'Home'),
        actions: <Widget>[
          IconButton(
            key: const Key('homePage_logout_iconButton'),
            icon: const Icon(Icons.logout),
            onPressed: () => context.read<AppBloc>().add(AppLogoutRequested()),
          )
        ],
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
