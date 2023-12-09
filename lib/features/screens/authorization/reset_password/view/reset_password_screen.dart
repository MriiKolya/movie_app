import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/config/router/export_router.dart';
import 'package:movie_app/core/value_objects/value_objects.dart';
import 'package:movie_app/core/widgets/widgets.dart';
import 'package:movie_app/features/screens/authorization/reset_password/cubit/cubit_reset_password/reset_password_cubit.dart';

import 'package:movie_app/features/screens/authorization/widgets/widgets.dart';

class ReserPasswordScreen extends StatelessWidget {
  ReserPasswordScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Form(
        key: _formKey,
        child: TemplateForm(
          title: 'Reset Password',
          subTitle: 'Enter your account email',
          constraints: constraints,
          children: [
            const Spacer(),
            TextFormFieldEmail(
              validator: (value) => EmailVO(value!).validate(),
              labeltext: 'Email',
              onChanged: (email) {
                context.read<ResetPasswordCubit>().emailChanged(email);
              },
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<ResetPasswordCubit>().resetPassword();
                  context.go(context.namedLocation(
                      AppNameRouter.verificationResetPasswordlScreen));
                }
              },
              child: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
                listener: (context, state) {
                  if (state.status == ResetPasswordStatus.error) {
                    showDialog(
                        context: context,
                        builder: (context) => const AllertDialogError(
                            title: 'Incorect Data',
                            subtitle: 'Нour email has no account',
                            textButton: 'ok'));
                  }
                },
                builder: (context, state) {
                  if (state.status == ResetPasswordStatus.submitting) {
                    return const CircularProgressIndicator();
                  }
                  return const Text('Send Code');
                },
              ),
            ),
            const Spacer(),
            FooterForRegister(constraints: constraints)
          ],
        ),
      );
    });
  }
}
