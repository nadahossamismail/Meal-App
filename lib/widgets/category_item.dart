import 'package:flutter/material.dart';

import 'package:meal_app/models/category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(this.item, {super.key});
  final Category item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      padding: const EdgeInsets.only(left: 15, top: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          gradient: LinearGradient(colors: [
            item.color.withOpacity(0.6),
            item.color.withOpacity(0.9),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: Text(
        item.title,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
