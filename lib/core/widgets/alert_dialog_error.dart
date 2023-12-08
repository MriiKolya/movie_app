import 'package:flutter/material.dart';

class AllertDialogError extends StatelessWidget {
  const AllertDialogError(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.textButton});

  final String title;
  final String subtitle;
  final String textButton;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: const EdgeInsets.all(0),
      title: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
      content: Text(
        subtitle,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.labelMedium,
      ),
      actions: [
        Center(
          child: OutlinedButton(
            style: const ButtonStyle(
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ))),
                fixedSize: MaterialStatePropertyAll(
                  Size(double.maxFinite, 30),
                )),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              textButton,
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ),
        )
      ],
    );
  }
}
