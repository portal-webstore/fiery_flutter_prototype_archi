import 'package:authentication_repository/authentication_repository.dart'
    as auth show User;
import 'package:fiery_flutter_prototype_archi/app/blocs/app_bloc.dart'
    show AppBloc, AppLogoutRequested;
import 'package:fiery_flutter_prototype_archi/home/keys/home_keys.dart'
    show HomeKeys;
import 'package:fiery_flutter_prototype_archi/shared/drawer/drawer.dart';
import 'package:fiery_flutter_prototype_archi/shared/widgets/logo/atoms/atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show ReadContext, SelectContext;

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
    this.title,
  }) : super(key: key);

  static const Key menuKey = HomeKeys.menuKey;

  static Page page() => const MaterialPage<void>(child: HomeScreen());

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const HomeScreen(),
    );
  }

  final String? title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final auth.User user = context.select(
      (AppBloc bloc) => bloc.state.user,
    );

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
      drawer: const SideMenuNavigationDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const WebstoreLogo(),
            const SizedBox(height: 4.0),
            Text(
              user.emailAddress,
              style: textTheme.headline6,
            ),
            const SizedBox(height: 4.0),
            Text(
              '${user.firstName} ${user.lastName}',
              style: textTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }
}
