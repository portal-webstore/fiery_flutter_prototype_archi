import 'package:fiery_flutter_prototype_archi/shared/drawer/drawer.dart'
    show MenuFooter, MenuHeader, MenuListItem;
import 'package:fiery_flutter_prototype_archi/shared/routes/routes.dart'
    show Routes;
import 'package:flutter/material.dart';

/// Includes header, body content and footer list tiles.
class NavigationMenuList extends StatelessWidget {
  const NavigationMenuList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        const MenuHeader(),
        MenuListItem(
          title: 'Home',
          icon: Icons.home,
          onTap: () {},
        ),
        MenuListItem(
          title: 'Create order',
          icon: Icons.add_shopping_cart,
          onTap: () {
            Navigator.pushReplacementNamed(
              context,
              Routes.wizardCreateStartOrder,
            );
          },
        ),
        MenuListItem(
          title: 'View orders',
          icon: Icons.local_shipping,
          onTap: () {},
        ),
        const Divider(),
        const MenuFooter(),
      ],
    );
  }
}
