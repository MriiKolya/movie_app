import 'package:flutter/material.dart';
import 'package:movie_app/core/domain/models/user_model.dart';

class AppBarDasboard extends StatelessWidget implements PreferredSizeWidget {
  const AppBarDasboard({
    super.key,
    required this.user,
  });

  final UserAuth user;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leadingWidth: 300,
      elevation: 0,
      scrolledUnderElevation: 0,
      actions: const [
        Padding(
            padding: EdgeInsets.only(right: 40),
            child: Row(
              children: [
                Icon(Icons.search),
                SizedBox(width: 10),
                Icon(Icons.notifications),
                SizedBox(width: 10),
                Icon(Icons.settings),
              ],
            )),
      ],
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
