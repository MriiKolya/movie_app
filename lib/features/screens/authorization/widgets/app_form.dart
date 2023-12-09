import 'package:flutter/material.dart';
import 'package:movie_app/features/constant/constant.dart';

class TemplateForm extends StatelessWidget {
  TemplateForm(
      {super.key,
      this.title,
      this.subTitle,
      required this.children,
      required this.constraints,
      this.subAdd});

  final formKey = GlobalKey<FormState>();
  final String? title;
  final String? subTitle;
  final String? subAdd;
  final List<Widget> children;
  final BoxConstraints constraints;

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
                  const Spacer(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        title != null
                            ? Text(
                                title!,
                                style: Theme.of(context).textTheme.titleLarge,
                              )
                            : const SizedBox(),
                        subTitle != null
                            ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                              .labelMedium?.copyWith(color: primaryColor),
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
