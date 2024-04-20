import 'package:flutter/material.dart';
import 'package:meal_app/data/categories_data.dart';

import 'package:meal_app/routes/meals_screen.dart';
import 'package:meal_app/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 0,
          childAspectRatio: 3 / 2,
        ),
        children: availableCategories
            .map((category) => InkWell(
                  radius: 30,
                  splashColor: Colors.grey,
                  borderRadius: BorderRadius.circular(14),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return MealsScreen(
                        category: category,
                      );
                    }));
                  },
                  child: CategoryItem(category),
                ))
            .toList(),
      ),
    );
  }
}
