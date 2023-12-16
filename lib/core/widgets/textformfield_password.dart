import 'package:flutter/material.dart';
import 'package:movie_app/features/constant/constant_color.dart';

class TextFormFieldPassword extends StatefulWidget {
  const TextFormFieldPassword({
    super.key,
    this.labeltext,
    this.textEditingController,
    this.validator,
    this.onChanged,
    required this.constraints,
  });

  final String? labeltext;
  final TextEditingController? textEditingController;
  final String? Function(String? value)? validator;
  final BoxConstraints constraints;
  final void Function(String)? onChanged;

  @override
  State<TextFormFieldPassword> createState() => _TextFormFieldPasswordState();
}

bool isobscureText = false;

class _TextFormFieldPasswordState extends State<TextFormFieldPassword> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: widget.constraints.maxWidth / 20),
      child: TextFormField(
        onChanged: widget.onChanged,
        validator: widget.validator,
        keyboardType: TextInputType.visiblePassword,
        obscureText: isobscureText,
        controller: widget.textEditingController,
        style: Theme.of(context).textTheme.labelLarge,
        decoration: InputDecoration(
          suffix: GestureDetector(
              onTap: () {
                setState(() {
                  isobscureText = !isobscureText;
                });
              },
              child: isobscureText
                  ? const Icon(Icons.visibility_off_outlined)
                  : const Icon(Icons.visibility_outlined)),
          labelText: widget.labeltext,
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
              borderSide: BorderSide(color: ConstantColor.primaryColor)),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300)),
        ),
      ),
    );
  }
}
