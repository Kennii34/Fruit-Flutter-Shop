// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:fruit/components/fruit_tile.dart';
import 'package:fruit/models/fruit.dart';
import 'package:fruit/models/fruit_shop.dart';
import 'package:fruit/pages/fruit_detail_page.dart'; // Import FruitDetailPage
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // add fruit to cart
  void addToCart(Fruit fruit) {
    // add to cart
    Provider.of<FruitShop>(context, listen: false).addItemToCart(fruit);

    // let user know it add ben successfully added
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Successfully added to cart"),
      ),
    );
  }

  // Navigate to fruit detail page
  void navigateToFruitDetailPage(Fruit fruit) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FruitDetailPage(fruit: fruit),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FruitShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              // heading message
              const Text(
                "What kind of fruit do you like?",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 25),

              // list of fruits to buy
              Expanded(
                child: ListView.builder(
                  itemCount: value.fruitShop.length,
                  itemBuilder: (context, index) {
                    // get individual fruit
                    Fruit eachFruit = value.fruitShop[index];
                    // return the title of fruit
                    return FruitTile(
                      fruit: eachFruit,
                      icon: Icon(Icons.add),
                      onPressed: () => addToCart(eachFruit),
                      onTap: () => navigateToFruitDetailPage(
                          eachFruit), // Navigate to fruit detail page
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
