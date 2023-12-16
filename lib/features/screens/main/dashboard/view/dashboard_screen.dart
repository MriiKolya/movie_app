import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/blocs/app_bloc/app_bloc.dart';
import 'package:movie_app/features/screens/main/dashboard/widgets/widgets.dart';

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
            ListUpcomingMovie(),
          ],
        ),
      ),
    );
  }
}
