import 'package:flutter/material.dart';

class AuthBySocialMedia extends StatelessWidget {
  const AuthBySocialMedia({
    super.key,
    required this.icon,
    required this.constraints,
    required this.onTap,
  });

  final IconData icon;
  final BoxConstraints constraints;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).primaryColor,
        ),
        width: constraints.maxWidth / 7,
        height: constraints.maxHeight / 10,
        child: Icon(
          icon,
          size: constraints.maxWidth / 10,
        ),
      ),
    );
  }
}
