import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/config/router/app_router_name.dart';
import 'package:movie_app/core/widgets/auth_by_socialmedia.dart';
import 'package:movie_app/features/constant/constant_color.dart';

class FooterForRegister extends StatelessWidget {
  const FooterForRegister({super.key, required this.constraints});

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            context.go(context.namedLocation(RouteConstants.loginRouteName));
          },
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
                text: 'Already have account ?',
                style: Theme.of(context).textTheme.labelSmall),
            const TextSpan(text: ' '),
            TextSpan(
                text: ' Log in',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: ConstantColor.secondPrimaryColor, fontWeight: FontWeight.bold))
          ])),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: constraints.maxHeight / 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AuthBySocialMedia(
                constraints: constraints,
                icon: Icons.g_mobiledata,
                onTap: () {},
              ),
              SizedBox(
                width: constraints.maxWidth / 20,
                height: constraints.maxHeight / 10,
              ),
              AuthBySocialMedia(
                constraints: constraints,
                icon: Icons.facebook,
                onTap: () {},
              ),
              SizedBox(
                width: constraints.maxWidth / 20,
                height: constraints.maxHeight / 10,
              ),
              AuthBySocialMedia(
                constraints: constraints,
                icon: Icons.apple,
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
