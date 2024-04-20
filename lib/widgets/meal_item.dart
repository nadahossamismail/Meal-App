import 'package:flutter/material.dart';
import 'package:meal_app/widgets/meal_info.dart';
import 'package:transparent_image/transparent_image.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  const MealItem({required this.meal, super.key});
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 10,
      margin: const EdgeInsets.only(left: 20, right: 15, top: 20, bottom: 5),
      child: Stack(children: [
        Hero(
          tag: meal.id,
          child: FadeInImage(
              height: 250,
              fit: BoxFit.cover,
              width: double.infinity,
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl)),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.only(top: 15, bottom: 20),
            color: Colors.black.withOpacity(0.5),
            child: Column(children: [
              Text(
                meal.title,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MealInfo(
                      icon: Icons.access_time, name: "${meal.duration} min"),
                  MealInfo(
                      icon: Icons.work,
                      name: meal.complexity.name[0].toUpperCase() +
                          meal.complexity.name.substring(1)),
                  MealInfo(
                      icon: Icons.attach_money_rounded,
                      name: meal.affordability.name[0].toUpperCase() +
                          meal.affordability.name.substring(1)),
                ],
              )
            ]),
          ),
        )
      ]),
    );
  }
}
