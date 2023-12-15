import 'package:flutter/material.dart';
import 'package:movie_app/features/domain/models/user_model.dart';

class AppBarDasboard extends StatelessWidget implements PreferredSizeWidget {
  const AppBarDasboard({
    super.key,
    required this.user,
  });

  final UserAuth user;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: const [
        Padding(
            padding: EdgeInsets.only(right: 40),
            child: Row(
              children: [
                Icon(Icons.notifications),
                SizedBox(width: 10),
                Icon(Icons.settings),
              ],
            )),
      ],
      backgroundColor: Colors.transparent,
      leadingWidth: 300,
      leading: Padding(
          padding: const EdgeInsets.only(left: 40),
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
              text: 'Welcome back, \n',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(fontWeight: FontWeight.w300),
            ),
            TextSpan(
                text: user.name,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    )),
          ]))),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
