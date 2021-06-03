import 'package:authentication_repository/authentication_repository.dart'
    as auth show User;
import 'package:fiery_flutter_prototype_archi/app/blocs/app_bloc.dart'
    show AppBloc, AppLogoutRequested;
import 'package:fiery_flutter_prototype_archi/order/atoms/padding.dart'
    show edgeInsetsPadding;
import 'package:fiery_flutter_prototype_archi/shared/drawer/drawer.dart'
    show SideMenuNavigationDrawer;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show ReadContext, SelectContext;

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({
    Key? key,
  }) : super(key: key);

  static const title = 'Dashboard';
  static const Key logoutButtonKey = Key('__dashboard_screen_logout_button__');

  static Page page() => const MaterialPage<void>(
        child: DashboardScreen(),
      );

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const DashboardScreen(),
    );
  }

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final auth.User user = context.select(
      (AppBloc bloc) => bloc.state.user,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(DashboardScreen.title),
        actions: <Widget>[
          IconButton(
            key: DashboardScreen.logoutButtonKey,
            icon: const Icon(Icons.logout),
            onPressed: () => context.read<AppBloc>().add(
                  AppLogoutRequested(),
                ),
          )
        ],
      ),
      drawer: const SideMenuNavigationDrawer(),
      body: SingleChildScrollView(
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
