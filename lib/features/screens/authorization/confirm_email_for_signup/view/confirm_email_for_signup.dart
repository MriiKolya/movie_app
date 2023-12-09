import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/config/router/export_router.dart';
import 'package:movie_app/core/widgets/alert_dialog_error.dart';
import 'package:movie_app/core/widgets/pinput_email.dart';
import 'package:movie_app/features/screens/authorization/confirm_email_for_signup/cubit/verification_signup_cubit.dart';
import 'package:movie_app/features/screens/authorization/widgets/app_form.dart';
import 'package:movie_app/features/screens/authorization/widgets/footer_for_register.dart';

class ConfirmEmailScreen extends StatelessWidget {
  const ConfirmEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return TemplateForm(
          title: 'Verification',
          subTitle: 'Enter the code sent to your email',
          subAdd: context.read<VerificationCubit>().signupCubit.state.email,
          constraints: constraints,
          children: [
            const Spacer(),
            EmailPinPut(
              onChanged: (token) {
                context.read<VerificationCubit>().tokenChanged(token);
              },
              onCompleted: (token) {
                context.read<VerificationCubit>().confirmOtp();
              },
            ),
            const Spacer(),
            SizedBox(
              child: BlocConsumer<VerificationCubit, VerificationState>(
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
                        context.read<VerificationCubit>().reSendOtp();
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
                listener: (BuildContext context, VerificationState state) {
                  if (state.status == VerificationStatus.succes) {
                    context.go(
                        context.namedLocation(AppNameRouter.dasboardScreen));
                  } else if (state.status == VerificationStatus.error) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            const AllertDialogError(
                              title: 'Incorect code',
                              subtitle: 'Please enter the correct code',
                              textButton: 'Try again',
                            ));
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