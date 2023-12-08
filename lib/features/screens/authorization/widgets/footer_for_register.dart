import 'package:flutter/material.dart';
import 'package:movie_app/core/widgets/auth_by_socialmedia.dart';

class FooterForRegister extends StatelessWidget {
  const FooterForRegister({super.key, required this.constraints});

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
