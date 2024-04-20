import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/data/meals_data.dart';
import 'package:meal_app/providers/filters_provider.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});

  @override
  ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
}

bool isGultenFree = false;
bool isLactoseFree = false;
bool isVegetarian = false;
bool isVegan = false;

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  @override
  Widget build(BuildContext context) {
    Map<MealCheck, bool> filters = {
      MealCheck.isGlutenFree: isGultenFree,
      MealCheck.isLactoseFree: isLactoseFree,
      MealCheck.isVegan: isVegan,
      MealCheck.isVegetarian: isVegetarian,
    };
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
      ),
      body: WillPopScope(
        onWillPop: () async {
          ref.read(filtersProvider.notifier).toggleVlues(filters);

          return true;
        },
        child: Column(
          children: [
            filterSwitch(context, "Gluten-free",
                "Only include gluten-free meals.", isGultenFree, (value) {
              setState(() {
                isGultenFree = value;
              });
            }),
            filterSwitch(context, "Lactose-free",
                "Only include Lastose-free meals.", isLactoseFree, (value) {
              setState(() {
                isLactoseFree = value;
              });
            }),
            filterSwitch(context, "Vegetarian",
                "Only include Vegetarian meals.", isVegetarian, (value) {
              setState(() {
                isVegetarian = value;
              });
            }),
            filterSwitch(context, "Vegan", "Only include Vegan meals.", isVegan,
                (value) {
              setState(() {
                isVegan = value;
              });
            }),
          ],
        ),
      ),
    );
  }

  SwitchListTile filterSwitch(
      BuildContext context, name, subtitle, variable, onChange) {
    return SwitchListTile(
        contentPadding: const EdgeInsets.only(left: 25, right: 25, top: 5),
        title: Text(
          name,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        value: variable,
        onChanged: onChange);
  }
}
