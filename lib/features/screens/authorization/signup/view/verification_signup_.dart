import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/config/router/export_router.dart';
import 'package:movie_app/core/widgets/snack_bar_message.dart';
import 'package:movie_app/core/widgets/pinput_email.dart';
import 'package:movie_app/features/screens/authorization/signup/cubit/verification_signup/verification_signup_cubit.dart';
import 'package:movie_app/features/screens/authorization/widgets/app_form.dart';
import 'package:movie_app/features/screens/authorization/widgets/footer_for_register.dart';

class VerificationSignUplScreen extends StatelessWidget {
  const VerificationSignUplScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return AppForm(
          title: 'Verification',
          subTitle: 'Enter the code sent to your email',
          subAdd:
              context.read<VerificationSignUpCubit>().signupCubit.state.email,
          constraints: constraints,
          children: [
            const Spacer(),
            EmailPinPut(
              onChanged: (token) {
                context.read<VerificationSignUpCubit>().tokenChanged(token);
              },
              onCompleted: (token) {
                context.read<VerificationSignUpCubit>().confirmOtp();
              },
            ),
            const Spacer(),
            SizedBox(
              child: BlocConsumer<VerificationSignUpCubit,
                  VerificationSignUpState>(
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
                        context.read<VerificationSignUpCubit>().reSendOtp();
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
                listener:
                    (BuildContext context, VerificationSignUpState state) {
                  if (state.status == VerificationStatus.succes) {
                    context.go(
                        context.namedLocation(AppNameRouter.dasboardScreen));
                  } else if (state.status == VerificationStatus.error) {
                    SnackBarMessage.showSnackBarException(
                      message: 'Incorect code',
                      context: context,
                    );
                  } else if (state.status == VerificationStatus.succes) {
                    SnackBarMessage.showSnackBarSucces(
                      message: '${state.email} has been registered',
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
