import 'package:flutter/material.dart';
import 'package:movie_app/features/constant/constant_color.dart';

class SearchingMovie extends StatelessWidget {
  const SearchingMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: TextFormField(
          cursorColor: ConstantColor.primaryColor,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: ConstantColor.secondBackgroundcolor,
              hintText: 'Search',
              focusColor: ConstantColor.primaryColor,
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide:
                    BorderSide(color: ConstantColor.primaryColor, width: 0.4),
              ),
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide:
                    BorderSide(color: ConstantColor.exceptionColor, width: 0.2),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(color: Colors.grey.shade800, width: 0.2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(color: Colors.grey.shade800, width: 0.2),
              ),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ))),
        ));
  }
}
