import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meal.dart';

class FavoritesProvider extends StateNotifier<List<Meal>> {
  FavoritesProvider() : super([]);
  bool toggleMealStatus(Meal meal) {
    bool isMarked = state.contains(meal);

    if (isMarked) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favorites = StateNotifierProvider<FavoritesProvider, List<Meal>>(
    (ref) => FavoritesProvider());
