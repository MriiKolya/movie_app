import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/config/router/router_name.dart';
import 'package:movie_app/core/widgets/snack_bar_message.dart';
import 'package:movie_app/core/widgets/pinput_email.dart';
import 'package:movie_app/features/screens/authorization/reset_password/cubit/cubit_verification_reset_password/verification_reset_password_cubit.dart';
import 'package:movie_app/features/screens/authorization/signup/cubit/verification_signup/verification_signup_cubit.dart';
import 'package:movie_app/features/screens/authorization/widgets/app_form.dart';
import 'package:movie_app/features/screens/authorization/widgets/footer_for_register.dart';

class VerificationResetPasswordScreen extends StatelessWidget {
  const VerificationResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return TemplateForm(
          title: 'Verification',
          subTitle: 'Enter the code sent to your email',
          subAdd: context
              .read<VerificationResetPasswordCubit>()
              .resetPasswordCubit
              .state
              .email,
          constraints: constraints,
          children: [
            const Spacer(),
            EmailPinPut(
              onChanged: (token) {
                context
                    .read<VerificationResetPasswordCubit>()
                    .tokenChanged(token);
              },
              onCompleted: (token) {
                context.read<VerificationResetPasswordCubit>().confirmOtp();
                context.push(context
                    .namedLocation(AppNameRouter.createNewPasswordScreen));
              },
            ),
            const Spacer(),
            SizedBox(
              child: BlocConsumer<VerificationResetPasswordCubit,
                  VerificationResetPasswordState>(
                builder: (context, state) {
                  if (state.codeStatus == CodeStatus.codesend) {
                    return Text(
                      'resent message has been sent',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(
                              fontWeight: FontWeight.w100,
                              color: Colors.grey.shade500),
                    );
                  } else if (state.codeStatus == CodeStatus.initial) {
                    return TextButton(
                      onPressed: () {
                        context
                            .read<VerificationResetPasswordCubit>()
                            .reSendOtp();
                      },
                      child: Text(
                        'send the code again',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                                fontWeight: FontWeight.w100,
                                color: Colors.grey.shade500),
                      ),
                    );
                  }
                  return const SizedBox();
                },
                listener: (BuildContext context,
                    VerificationResetPasswordState state) {
                  if (state.status == VerificationResetPasswordStatus.succes) {
                    context.go(
                        context.namedLocation(AppNameRouter.dasboardScreen));
                  } else if (state.status ==
                      VerificationResetPasswordStatus.error) {
                    SnackBarMessage.showSnackBarException(
                      message: 'Incorect code',
                      context: context,
                    );
                  }
                },
              ),
            ),
            const Spacer(),
            FooterForRegister(constraints: constraints)
          ]);
    });
  }
}
