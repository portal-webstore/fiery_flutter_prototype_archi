import 'package:flutter/material.dart';

/// e.g. Recent orders,
/// Or simply show the orders on hold
/// Draft order button
/// May not need this many parts
/// Only really need to direct to the order history
class DashboardTile extends StatelessWidget {
  const DashboardTile({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  // final int? count;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(title),
                const SizedBox(
                  height: 32.0,
                  width: 32.0,
                ),

                /// No count, depending on Firestore agg query usability / cost
                /// Text(count),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
