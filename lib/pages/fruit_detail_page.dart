// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fruit/models/fruit.dart';

class FruitDetailPage extends StatelessWidget {
  final Fruit fruit;

  const FruitDetailPage({Key? key, required this.fruit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(fruit.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              color: _getTileColor(fruit.name),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    fruit.name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Price: ${fruit.price}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Image.asset(
                    fruit.imagePath,
                    height: 200,
                    width: 200,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Details of ${fruit.name}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getTileColor(String fruitName) {
    switch (fruitName) {
      case 'Banana':
        return Colors.yellow[50]!;
      case 'Coconut':
        return Colors.brown[50]!;
      case 'Grapes':
        return Colors.green[50]!;
      case 'Orange':
        return Colors.orange[50]!;
      case 'Watermelon':
        return Colors.red[50]!;
      default:
        return Colors.amber[50]!;
    }
  }
}
