import 'package:flutter/material.dart';
import 'package:movie_app/core/widgets/widgets.dart';

class SearchingMovie extends StatelessWidget {
  const SearchingMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: const TextFormFieldEmail(
        labeltext: 'Search movie',
      ),
    );
  }
}
