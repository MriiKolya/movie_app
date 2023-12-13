import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/config/router/app_router_name.dart';
import 'package:movie_app/core/value_objects/value_objects.dart';
import 'package:movie_app/core/widgets/widgets.dart';
import 'package:movie_app/features/screens/authorization/signup/cubit/signup_cubit/signup_cubit.dart';
import 'package:movie_app/features/screens/authorization/widgets/widgets.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Form(
        key: _formKey,
        child: AppForm(
            title: 'Hi, Welcome',
            subTitle: 'Hello there sign up to continue',
            constraints: constraints,
            children: [
              const Spacer(),
              TextFormFieldEmail(
                labeltext: 'Name',
                onChanged: (name) {
                  context.read<SignupCubit>().nameChanged(name);
                },
                validator: (value) => NameVO(value!).validate(),
              ),
              TextFormFieldEmail(
                  labeltext: 'Email',
                  onChanged: (email) {
                    context.read<SignupCubit>().emailChanged(email);
                  },
                  validator: (value) => EmailVO(value!).validate()),
              TextFormFieldPassword(
                labeltext: 'Password',
                onChanged: (password) {
                  context.read<SignupCubit>().passwordChanged(password);
                },
                validator: (value) => PasswordVO(value!).validate(),
                constraints: constraints,
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    context.read<SignupCubit>().signUp();
                  }
                },
                child: BlocConsumer<SignupCubit, SignupState>(
                    builder: (context, state) {
                  if (state.status == SignUpStatus.submitting) {
                    return const CircularProgressIndicator();
                  }
                  return const Text(
                    'Sign Up',
                  );
                }, listener: (BuildContext context, SignupState state) {
                  if (state.status == SignUpStatus.succes) {
                    context.push(context.namedLocation(
                        RouteConstants.verificationSignUpRouteName));
                  } else if (state.status == SignUpStatus.error) {
                    SnackBarMessage.showSnackBarException(
                      message: ' Something went wrong \n Try again later.',
                      context: context,
                    );
                  } else if (state.status == SignUpStatus.alreadyRegistered) {
                    SnackBarMessage.showSnackBarException(
                      message: 'The user is already registered.',
                      context: context,
                    );
                  }
                }),
              ),
              const Spacer(),
              FooterForRegister(constraints: constraints)
            ]),
      );
    });
  }
}
