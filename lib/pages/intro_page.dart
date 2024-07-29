// ignore_for_file: use_super_parameters, unused_import

import 'package:flutter/material.dart';
import 'package:fruit/pages/home_page.dart'; // Import the HomePage class

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome to my fruit shop",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Image.asset(
              '../../lib/images/basket.png',
              width: 200,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
