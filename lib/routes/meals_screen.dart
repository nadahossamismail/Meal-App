import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/providers/filters_provider.dart';
import 'package:meal_app/routes/meal_details_screen.dart';
import 'package:meal_app/widgets/meal_item.dart';
import '../models/meal.dart';

class MealsScreen extends ConsumerWidget {
  const MealsScreen({required this.category, super.key});
  final Category category;

  @override
  Widget build(BuildContext context, ref) {
    List<Meal> currentCategoryMeals = ref.watch(filteredMealsProvider);
    if (category.id != "all meals") {
      currentCategoryMeals = currentCategoryMeals
          .where((meal) => meal.categories.contains(category.id))
          .toList();
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(category.title),
        ),
        body: currentCategoryMeals.isNotEmpty
            ? ListView.builder(
                itemCount: currentCategoryMeals.length,
                itemBuilder: (ctx, index) {
                  return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => MealDetails(
                                meal: currentCategoryMeals[index])));
                      },
                      radius: 30,
                      splashColor: Colors.grey,
                      borderRadius: BorderRadius.circular(14),
                      child: MealItem(meal: currentCategoryMeals[index]));
                })
            : Center(
                child: Text(
                  "Sorry.. no meals here!",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: const Color.fromARGB(255, 122, 121, 121),
                      fontSize: 25),
                ),
              ));
  }
}
