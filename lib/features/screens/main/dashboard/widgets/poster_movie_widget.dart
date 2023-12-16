import 'package:flutter/material.dart';
import 'package:movie_app/features/constant/constant_color.dart';

class PosterMovie extends StatelessWidget {
  const PosterMovie({
    super.key,
    required this.posterImage,
    required this.rateMovie,
    required this.width,
  });

  final String posterImage;
  final double width;
  final num rateMovie;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              posterImage,
            ),
            fit: BoxFit.cover,
          ),
          color: Colors.grey.shade700,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: rateMovie != 0
            ? Padding(
                padding: const EdgeInsets.all(10),
                child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                        width: 70,
                        height: 30,
                        decoration: const BoxDecoration(
                            color: ConstantColor.primaryColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Text(
                                  num.parse(rateMovie.toStringAsFixed(2))
                                      .toString(),
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.labelLarge,
                                ))
                          ],
                        ))),
              )
            : const SizedBox());
  }
}
