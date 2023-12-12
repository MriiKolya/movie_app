import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/features/constant/constant.dart';

class TemplateForm extends StatelessWidget {
  TemplateForm(
      {super.key,
      this.title,
      this.subTitle,
      this.backButton = true,
      required this.children,
      required this.constraints,
      this.subAdd});

  final formKey = GlobalKey<FormState>();
  final String? title;
  final String? subTitle;
  final String? subAdd;
  final List<Widget> children;
  final BoxConstraints constraints;
  final bool backButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth / 15),
          child: SingleChildScrollView(
            child: SizedBox(
              height: constraints.maxHeight / 1.18,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            backButton == true
                                ? Align(
                                    alignment: Alignment.topLeft,
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.arrow_back_ios,
                                        size: 30,
                                        color: primaryColor,
                                      ),
                                      onPressed: () {
                                        GoRouter.of(context).pop();
                                      },
                                    ),
                                  )
                                : const SizedBox(),
                            title != null
                                ? Text(
                                    title!,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  )
                                : const SizedBox(),
                          ],
                        ),
                        subTitle != null
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    subTitle!,
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                  subAdd != null
                                      ? Text(
                                          subAdd!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium
                                              ?.copyWith(color: primaryColor),
                                        )
                                      : const SizedBox(),
                                ],
                              )
                            : const SizedBox(),
                        SizedBox(
                          height: constraints.maxHeight / 1.4,
                          child: Column(
                            children: children,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
