// ignore_for_file: use_super_parameters, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int)? onTabChange;

  MyBottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onTabChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      child: GNav(
        selectedIndex: selectedIndex,
        onTabChange: (index) => onTabChange!(index),
        color: Colors.grey[500],
        mainAxisAlignment: MainAxisAlignment.center,
        activeColor: Colors.black,
        tabs: const [
          GButton(icon: Icons.home_outlined),
          GButton(icon: Icons.store_outlined),
          GButton(icon: Icons.shopping_bag_outlined),
          GButton(icon: Icons.person_outline),
        ],
      ),
    );
  }
}
