import 'package:flutter/material.dart';

class MealInfo extends StatelessWidget {
  const MealInfo({required this.icon, required this.name, super.key});
  final IconData icon;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 15,
          color: Colors.white,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          name,
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(color: Colors.white, fontSize: 17),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
