import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/blocs/app_bloc/app_bloc.dart';
import 'package:movie_app/features/screens/main/dashboard/widgets/app_bar_dasboard.dart';
import 'package:movie_app/features/screens/main/dashboard/widgets/list_popular_movie_widget.dart';
import 'package:movie_app/features/screens/main/dashboard/widgets/searching_movie_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return Scaffold(
      appBar: AppBarDasboard(user: user),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SearchingMovie(),
            ListPopularMovie(),
          ],
        ),
      ),
    );
  }
}
