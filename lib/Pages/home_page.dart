import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg1_21/Controller/bottom_nav_controller.dart';
import 'package:pas1_mobile_11pplg1_21/Menu/Favorite.dart';
import 'package:pas1_mobile_11pplg1_21/Menu/Team.dart';
import 'package:pas1_mobile_11pplg1_21/Menu/profile.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';


class MainPage extends StatelessWidget {
  final BottomNavController bottomNavController = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[50],
        child: Obx(() {
          return IndexedStack(
            index: bottomNavController.selectedIndex.value,
            children: [
              TeamPage(),
              Favorite(),
              Profile(),
            ],
          );
        }),
      ),
      bottomNavigationBar: Obx(() {
        return SlidingClippedNavBar(
          backgroundColor: Colors.white,
          onButtonPressed: bottomNavController.changeIndex,
          iconSize: 30,
          activeColor: Color(0xFF4A4A4A),
          selectedIndex: bottomNavController.selectedIndex.value,
          barItems: [
            BarItem(
              icon: Icons.home_filled,
              title: 'Team',
            ),
            BarItem(
              icon: Icons.history_rounded,
              title: 'Favorite',
            ),
            BarItem(
              icon: Icons.person_rounded,
              title: 'Profile',
            ),
          ],
        );
      }),
    );
  }
}
