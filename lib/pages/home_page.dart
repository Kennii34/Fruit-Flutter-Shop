// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fruit/components/bottom_nav_bar.dart';
import 'package:fruit/pages/about_page.dart';
import 'package:fruit/pages/intro_page.dart';
import 'package:fruit/pages/shop_page.dart';
import 'package:fruit/pages/cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getPage(_selectedIndex),
      bottomNavigationBar: MyBottomNavBar(
        selectedIndex: _selectedIndex,
        onTabChange: _onTabChange,
      ),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return IntroPage();
      case 1:
        return ShopPage();
      case 2:
        return CartPage();
      case 3:
        return AboutPage();
      default:
        return Container();
    }
  }
}
