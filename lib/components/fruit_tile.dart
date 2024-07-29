// ignore_for_file: prefer_const_constructors_in_immutables, use_super_parameters

import 'package:flutter/material.dart';
import 'package:fruit/models/fruit.dart';

class FruitTile extends StatelessWidget {
  final Fruit fruit;
  final VoidCallback? onTap; // Define onTap callback
  final VoidCallback? onPressed;
  final Widget icon;

  FruitTile({
    Key? key,
    required this.fruit,
    required this.onPressed,
    required this.icon,
    this.onTap, // Add onTap parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color tileColor;

    if (fruit.name == 'Banana') {
      tileColor = Colors.yellow[50]!;
    } else if (fruit.name == 'Coconut') {
      tileColor = Colors.brown[50]!;
    } else if (fruit.name == 'Grapes') {
      tileColor = Colors.green[50]!;
    } else if (fruit.name == 'Orange') {
      tileColor = Colors.orange[50]!;
    } else if (fruit.name == 'Watermelon') {
      tileColor = Colors.red[50]!;
    } else {
      tileColor = Colors.amber[50]!;
    }

    return GestureDetector(
      // Wrap with GestureDetector to enable onTap
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: tileColor,
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.only(bottom: 10),
        child: ListTile(
          contentPadding: const EdgeInsets.all(20),
          title: Text(
            fruit.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          subtitle: Text(
            '฿ ${fruit.price}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          leading: Image.asset(fruit.imagePath),
          trailing: IconButton(
            icon: icon,
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
