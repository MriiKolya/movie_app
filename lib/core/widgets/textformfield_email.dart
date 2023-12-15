import 'package:flutter/material.dart';
import 'package:movie_app/features/constant/constant.dart';

class TextFormFieldEmail extends StatelessWidget {
  const TextFormFieldEmail(
      {super.key,
      this.labeltext,
      this.textEditingController,
      this.validator,
      this.onChanged});

  final String? labeltext;
  final TextEditingController? textEditingController;
  final String? Function(String? value)? validator;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: constraints.maxWidth / 20),
        child: TextFormField(
            onChanged: onChanged,
            validator: validator,
            keyboardType: TextInputType.emailAddress,
            controller: textEditingController,
            style: Theme.of(context).textTheme.labelLarge,
            decoration: InputDecoration(
              labelText: labeltext,
              labelStyle: Theme.of(context).textTheme.titleMedium,
              border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.grey.shade300)),
              errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.red)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.grey.shade300)),
              focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Constant.primaryColor)),
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300)),
            )),
      );
    });
  }
}
