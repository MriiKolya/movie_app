import 'package:flutter/material.dart';
import 'package:movie_app/features/constant/constant_color.dart';

abstract class SnackBarMessage {
  static void showSnackBarException({
    required String message,
    required BuildContext context,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(16),
          height: 80,
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30)),
            color: ConstantColor.exceptionColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundColor: Color.fromARGB(68, 244, 67, 54),
                    child: Icon(
                      Icons.priority_high,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(color: Colors.black, fontSize: 18),
                  ),
                  const SizedBox(
                    width: 30,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void showSnackBarSucces({
    required String message,
    required BuildContext context,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        dismissDirection: DismissDirection.up,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 75),
        elevation: 0,
        backgroundColor: Colors.transparent,
        content: Container(
          // padding: const EdgeInsets.all(16),
          height: 80,
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30)),
            color: ConstantColor.succesColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white10,
                    child: Icon(
                      Icons.check,
                      size: 30,
                      color: Colors.green[200],
                    ),
                  ),
                  Flexible(
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(color: Colors.black, fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
