import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/blocs/bloc/app_bloc.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leadingWidth: double.infinity,
        actions: const [
          Padding(
            padding: EdgeInsets.only(top: 20, right: 40),
            child: CircleAvatar(
              radius: 30,
              child: Icon(
                Icons.person,
              ),
            ),
          )
        ],
        leading: Padding(
          padding: const EdgeInsets.only(left: 40, top: 40),
          child: Text('Hi, ${user.name}',
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.titleLarge),
        ),
      ),
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}
