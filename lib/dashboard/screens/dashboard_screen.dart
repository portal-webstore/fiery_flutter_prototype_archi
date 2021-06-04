import 'package:authentication_repository/authentication_repository.dart'
    as auth show User;
import 'package:fiery_flutter_prototype_archi/app/blocs/app_bloc.dart'
    show AppBloc, AppLogoutRequested;
import 'package:fiery_flutter_prototype_archi/clinic/atoms/clinic_delivery_time_disclaimer_text.dart';
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
          children: [
            Text(
              'TEST clinic',
              style: Theme.of(context).textTheme.headline2,
            ),
            Container(
              padding: edgeInsetsPadding,
              child: const ClinicDeliveryTimeDisclaimerText(),
            ),
            GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 2 / 3,
              // Shrink wrap otherwise conflicts with parent column/row
              // Renderbox not laid out
              shrinkWrap: true,
              children: const [
                MockDashboardTile(
                  count: 7,
                  title: 'Recent orders',
                ),

                /// Orders that have at least one item awaiting clinic confirm
                MockDashboardTile(
                  count: 3,
                  title: 'Orders awaiting confirmation',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MockDashboardTile extends StatelessWidget {
  const MockDashboardTile({
    Key? key,
    required this.title,
    required this.count,
  }) : super(key: key);

  final String title;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      margin: edgeInsetsPadding,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryVariant.withOpacity(
                0.1,
              ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: edgeInsetsPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          count.toString(),
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.list),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
