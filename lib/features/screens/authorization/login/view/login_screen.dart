import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/config/router/router_name.dart';
import 'package:movie_app/features/screens/authorization/login/cubit/login_cubit.dart';
import 'package:movie_app/core/value_objects/value_objects.dart';
import 'package:movie_app/core/widgets/widgets.dart';
import 'package:movie_app/features/screens/authorization/widgets/widgets.dart';

class LoginnScreen extends StatelessWidget {
  LoginnScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Form(
        key: _formKey,
        child: AppForm(
          backButton: false,
          title: 'Welcome Back',
          subTitle: 'Hello there Log in to continue',
          constraints: constraints,
          children: [
            const Spacer(),
            TextFormFieldEmail(
              labeltext: 'Email',
              onChanged: (email) {
                context.read<LoginCubit>().emailChanged(email);
              },
              validator: (value) => EmailVO(value!).validate(),
            ),
            TextFormFieldPassword(
              labeltext: 'Password',
              validator: (value) => PasswordVO(value!).validate(),
              onChanged: (password) {
                context.read<LoginCubit>().passwordChanged(password);
              },
              constraints: constraints,
            ),
            TextButton(
              onPressed: () {
                context.push(
                    context.namedLocation(AppNameRouter.resetPasswordScreen));
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: Text('Forgot password ?',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w300,
                        color: Colors.grey.shade300,
                        fontSize: 16)),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  context.read<LoginCubit>().logIn();
                }
              },
              child: BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state.status == LoginStatus.succes) {
                    SnackBarMessage.showSnackBarSucces(
                      message: 'Welcome ${state.email}',
                      context: context,
                    );
                    context.go(
                        context.namedLocation(AppNameRouter.dasboardScreen));
                  } else if (state.status == LoginStatus.error) {
                    SnackBarMessage.showSnackBarException(
                      message: 'Wrong email or password',
                      context: context,
                    );
                  }
                },
                builder: (BuildContext context, LoginState state) {
                  return state.status == LoginStatus.submitting
                      ? const CircularProgressIndicator(
                          color: Colors.black,
                        )
                      : const Text(
                          'Log In',
                        );
                },
              ),
            ),
            const Spacer(),
            FooterForLogin(constraints: constraints)
          ],
        ),
      );
    });
  }
}
