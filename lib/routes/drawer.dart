import 'package:flutter/material.dart';

import 'package:meal_app/widgets/drawer_item.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DrawerHeader(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimaryContainer),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.fastfood,
                  size: 37,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  "COOKING UP!",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.white),
                )
              ],
            )),
        const DrawerItem(
          icon: Icons.restaurant_sharp,
          name: "Meals",
        ),
        const DrawerItem(
          icon: Icons.settings,
          name: "Filters",
        ),
      ],
    );
  }
}
