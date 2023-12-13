import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/blocs/bloc/app_bloc.dart';
import 'package:movie_app/features/constant/constant.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int selectedIndex = 0;
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
        backgroundColor: backgroundColor,
        barItems: [
          BarItem(title: 'Dasboard', icon: Icons.home),
          BarItem(title: 'Search', icon: Icons.search),
          BarItem(title: 'Profile', icon: Icons.person),
        ],
        selectedIndex: selectedIndex,
        onButtonPressed: (int index) {
          setState(() {
            selectedIndex = index;
          });
          goToBranch(selectedIndex);
        },
        activeColor: primaryColor,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<AppBloc>().add(AppLogoutRequasted());
          // SnackBarMessage.showSnackBarSucces(
          //     message: 'message', context: context);
        },
        child: const Icon(Icons.logout),
      ),
      body: Center(child: widget.navigationShell),
    );
  }
}
