import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/favorites_provider.dart';
import '../widgets/meal_item.dart';
import 'meal_details_screen.dart';

class FavoritesScreen extends ConsumerStatefulWidget {
  const FavoritesScreen({super.key});

  @override
  ConsumerState<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends ConsumerState<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    final favoriteMealsList = ref.watch(favorites);
    return Scaffold(
        body: favoriteMealsList.isEmpty
            ? Center(
                child: Text(
                "Add some favorite meals",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.grey),
              ))
            : ListView.builder(
                itemCount: favoriteMealsList.length,
                itemBuilder: (ctx, index) {
                  return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) =>
                                MealDetails(meal: favoriteMealsList[index])));
                      },
                      radius: 30,
                      splashColor: Colors.grey,
                      borderRadius: BorderRadius.circular(14),
                      child: MealItem(meal: favoriteMealsList[index]));
                }));
  }
}
