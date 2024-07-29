// ignore_for_file: prefer_const_constructors, sort_child_properties_last, unnecessary_string_escapes, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:fruit/components/fruit_tile.dart';
import 'package:fruit/models/fruit.dart';
import 'package:fruit/models/fruit_shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // remove item from cart
  void removeFromCart(Fruit fruit) {
    // remove from cart
    Provider.of<FruitShop>(context, listen: false).removeItemFromCart(fruit);
  }

  // Pay now action
  void payNow() {
    // Show alert dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Payment Successful"),
          content: Text("Thank you for your purchase!"),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                // Close the dialog
                Navigator.of(context).pop();

                // Clear the cart
                Provider.of<FruitShop>(context, listen: false).clearCart();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    FruitShop fruitShop = Provider.of<FruitShop>(context);
    List<Fruit> cartItems = fruitShop.userCart;

    // Calculate total sum
    double totalSum = 0;
    for (Fruit fruit in cartItems) {
      totalSum += fruit.price;
    }

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.center, // Align items in the center
            children: [
              // Heading text
              Text(
                'Your Cart',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 25),

              // list of cart items
              if (cartItems.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      Fruit eachFruit = cartItems[index];
                      return Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: FruitTile(
                          fruit: eachFruit,
                          onPressed: () => removeFromCart(eachFruit),
                          icon: const Icon(Icons.delete),
                        ),
                      );
                    },
                  ),
                ),

              // Total sum
              if (cartItems.isNotEmpty)
                Text(
                  'Total: \฿ ${totalSum.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              // Pay button
              if (cartItems.isNotEmpty)
                GestureDetector(
                  onTap: payNow,
                  child: Container(
                    margin: const EdgeInsets.only(top: 15),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 25),
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        "Pay Now",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
