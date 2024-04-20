import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/data/meals_data.dart';

class FiltersProvider extends StateNotifier<Map<MealCheck, bool>> {
  FiltersProvider()
      : super({
          MealCheck.isGlutenFree: false,
          MealCheck.isLactoseFree: false,
          MealCheck.isVegan: false,
          MealCheck.isVegetarian: false,
        });

  void toggleVlues(Map<MealCheck, bool> updatedMap) {
    state = updatedMap;
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersProvider, Map<MealCheck, bool>>(
        (ref) => FiltersProvider());

final filteredMealsProvider = Provider((ref) {
  var filters = ref.watch(filtersProvider);
  return dummyMeals.where((meal) {
    if (filters[MealCheck.isGlutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (filters[MealCheck.isLactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (filters[MealCheck.isVegan]! && !meal.isVegan) {
      return false;
    }
    if (filters[MealCheck.isVegetarian]! && !meal.isVegetarian) {
      return false;
    }
    return true;
  }).toList();
});
