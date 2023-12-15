import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/features/constant/constant.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  late int selectedIndex = widget.navigationShell.currentIndex;
  void goToBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SlidingClippedNavBar(
        inactiveColor: Colors.white,
        backgroundColor: Constant.backgroundColor,
        barItems: [
          BarItem(title: 'Dasboard', icon: Icons.home),
          BarItem(title: 'Search', icon: Icons.search),
          BarItem(title: 'Favorite', icon: Icons.favorite),
          BarItem(title: 'Profile', icon: Icons.person),
        ],
        selectedIndex: selectedIndex,
        onButtonPressed: (int index) {
          setState(() {
            selectedIndex = index;
          });
          goToBranch(selectedIndex);
        },
        activeColor: Constant.primaryColor,
      ),
      body: Center(child: widget.navigationShell),
    );
  }
}
