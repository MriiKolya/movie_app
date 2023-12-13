import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/config/router/app_router_name.dart';
import 'package:movie_app/core/widgets/widgets.dart';
import 'package:movie_app/features/constant/constant.dart';
import 'package:movie_app/features/repositories/auth_repository.dart';

class FooterForLogin extends StatelessWidget {
  const FooterForLogin({super.key, required this.constraints});

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          const Expanded(
            child: Divider(
              color: Colors.white,
              thickness: 1,
            ),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: constraints.maxWidth / 40),
            child: Text('Or Log in with',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: secondPrimaryColor, fontWeight: FontWeight.bold)),
          ),
          const Expanded(
            child: Divider(
              color: Colors.white,
              thickness: 1,
            ),
          ),
        ],
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: constraints.maxHeight / 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AuthBySocialMedia(
              constraints: constraints,
              icon: Icons.g_mobiledata,
              onTap: () async {
                await AuthRepository().onSignWithGoogle();
              },
            ),
            AuthBySocialMedia(
              constraints: constraints,
              icon: Icons.facebook,
              onTap: () {},
            ),
            AuthBySocialMedia(
              constraints: constraints,
              icon: Icons.apple,
              onTap: () {},
            ),
          ],
        ),
      ),
      GestureDetector(
        onTap: () {
          context.push(context.namedLocation(RouteConstants.signUpRouteName));
        },
        child: RichText(
            text: TextSpan(children: [
          TextSpan(
              text: 'Don’t have account ?',
              style: Theme.of(context).textTheme.labelSmall),
          const TextSpan(text: ' '),
          TextSpan(
              text: 'Sign up',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: secondPrimaryColor, fontWeight: FontWeight.bold))
        ])),
      )
    ]);
  }
}
