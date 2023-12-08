import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/blocs/bloc/app_bloc.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<AppBloc>().add(AppLogoutRequasted());
        },
        child: const Icon(Icons.logout),
      ),
      body: Center(
        child: Text(user.email.toString()),
      ),
    );
  }
}
