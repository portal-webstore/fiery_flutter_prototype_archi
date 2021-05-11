import 'package:fiery_flutter_prototype_archi/shared/drawer/organisms/navigation_menu_list_organism.dart'
    show NavigationMenuList;
import 'package:flutter/material.dart';

class SideMenuNavigationDrawer extends StatelessWidget {
  const SideMenuNavigationDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: NavigationMenuList(),
    );
  }
}
