import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/favorites_provider.dart';
import '../models/meal.dart';

class MealDetails extends ConsumerStatefulWidget {
  const MealDetails({required this.meal, super.key});
  final Meal meal;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _MealDetailsState();
  }
}

class _MealDetailsState extends ConsumerState<MealDetails> {
  @override
  Widget build(BuildContext context) {
    var favoriteMeals = ref.watch(favorites);
    bool isIncluded = favoriteMeals.contains(widget.meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meal.title),
        actions: [
          IconButton(
              onPressed: () {
                bool isAdded =
                    ref.read(favorites.notifier).toggleMealStatus(widget.meal);
                var message =
                    isAdded ? "Successfully added" : "Successfully removed";
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(message)));
              },
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 280),
                transitionBuilder: (child, animation) {
                  return ScaleTransition(
                    alignment: Alignment.topCenter,
                    scale: Tween<double>(begin: 0, end: 1).animate(animation),
                    child: child,
                  );
                },
                child: Icon(
                  Icons.favorite,
                  color: isIncluded
                      ? const Color.fromARGB(255, 185, 16, 4)
                      : Colors.grey,
                  key: ValueKey(isIncluded),
                ),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
                tag: widget.meal.id,
                child: Card(
                  elevation: 10,
                  clipBehavior: Clip.hardEdge,
                  margin: const EdgeInsets.all(10),
                  child: Image.network(
                    widget.meal.imageUrl,
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                )),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    "Ingredients",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  ...widget.meal.ingredients.map((ingredient) {
                    return Text("$ingredient.",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 21));
                  }),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 5),
              child: Text(
                "Steps",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            ...widget.meal.steps.map((step) {
              return Padding(
                padding: const EdgeInsets.only(left: 15, right: 10, bottom: 5),
                child: Text(
                  "- $step",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 21,
                      ),
                ),
              );
            }),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
