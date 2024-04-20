import 'package:flutter/material.dart';
import 'package:meal_app/models/category.dart';

import 'package:meal_app/routes/filters_screen.dart';
import 'package:meal_app/routes/meals_screen.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({required this.icon, required this.name, super.key});

  final IconData icon;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: ListTile(
        onTap: () {
          Navigator.of(context).pop();
          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            var allMeals = Category(
                id: "all meals", color: Colors.black, title: "All Meals");
            return name == "Meals"
                ? MealsScreen(category: allMeals)
                : const FiltersScreen();
          }));
        },
        leading: Icon(
          icon,
          size: 25,
        ),
        title: Text(
          name,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
