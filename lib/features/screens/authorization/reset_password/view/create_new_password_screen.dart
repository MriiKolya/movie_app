import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/config/router/app_router_name.dart';
import 'package:movie_app/core/value_objects/password_vo.dart';
import 'package:movie_app/core/widgets/snack_bar_message.dart';
import 'package:movie_app/core/widgets/textformfield_password.dart';
import 'package:movie_app/features/screens/authorization/reset_password/cubit/cubit_create_new_password/create_new_password_cubit.dart';
import 'package:movie_app/features/screens/authorization/widgets/app_form.dart';
import 'package:movie_app/features/screens/authorization/widgets/footer_for_register.dart';

final _formKey = GlobalKey<FormState>();

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Form(
        key: _formKey,
        child: AppForm(
            title: 'Hello',
            subTitle: 'now enter a new password for your account',
            subAdd: context
                .read<CreateNewPasswordCubit>()
                .resetPasswordCubit
                .state
                .email,
            constraints: constraints,
            children: [
              const Spacer(),
              TextFormFieldPassword(
                labeltext: 'Password',
                onChanged: (email) {
                  context
                      .read<CreateNewPasswordCubit>()
                      .newPasswordChanged(email);
                },
                validator: (value) => PasswordVO(value!).validate(),
                constraints: constraints,
              ),
              TextFormFieldPassword(
                labeltext: 'Re-password',
                onChanged: (rePassword) {
                  context
                      .read<CreateNewPasswordCubit>()
                      .rePasswordChanged(rePassword);
                },
                validator: (value) => PasswordVO(value!).validate(),
                constraints: constraints,
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    context.read<CreateNewPasswordCubit>().updatePassword();
                  }
                },
                child: BlocConsumer<CreateNewPasswordCubit,
                    CreateNewPasswordState>(
                  builder: (context, state) {
                    if (state.status == CreateNewPasswordStatus.submitting) {
                      return const CircularProgressIndicator();
                    }
                    return const Text(
                      'Continue',
                    );
                  },
                  listener:
                      (BuildContext context, CreateNewPasswordState state) {
                    if (state.status == CreateNewPasswordStatus.succes) {
                      SnackBarMessage.showSnackBarSucces(
                        message: 'the password has been successfully changed',
                        context: context,
                      );
                      context.go(
                          context.namedLocation(RouteConstants.loginRouteName));
                    } else if (state.status == CreateNewPasswordStatus.error) {
                      SnackBarMessage.showSnackBarException(
                        message: 'Something went wrong \n Try again later',
                        context: context,
                      );
                    }
                  },
                ),
              ),
              const Spacer(),
              FooterForRegister(constraints: constraints)
            ]),
      );
    });
  }
}
