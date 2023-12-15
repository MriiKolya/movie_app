import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/blocs/movie_bloc/popularity_movie_bloc/popularity_movie_bloc.dart';

class ListPopularMovie extends StatelessWidget {
  const ListPopularMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Popular movies',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        BlocBuilder<PopularityMovieBloc, PopularityMovieState>(
          builder: (context, state) {
            if (state.status == PopularityMovieStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.status == PopularityMovieStatus.succes) {
              return CarouselSlider.builder(
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height / 3,
                  viewportFraction: 0.6,
                  autoPlay: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                ),
                itemCount: state.listPopularMovie.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            "https://image.tmdb.org/t/p/w500/${state.listPopularMovie[index].posterPath}",
                          ),
                          fit: BoxFit.cover),
                      color: Colors.grey.shade700,
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                    ),
                  );
                },
              );
            } else if (state.status == PopularityMovieStatus.error) {
              print('error');
            }

            return Container();
          },
        ),
      ],
    );
  }
}
