import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/blocs/movie_bloc/popularity_movie_bloc/popularity_movie_bloc.dart';
import 'package:movie_app/features/screens/main/dashboard/widgets/poster_movie_widget.dart';

class ListPopularMovie extends StatelessWidget {
  const ListPopularMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
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
                  enlargeStrategy: CenterPageEnlargeStrategy.scale,
                  enableInfiniteScroll: true,
                  height: MediaQuery.of(context).size.height / 3,
                  viewportFraction: 0.6,
                  autoPlay: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                ),
                itemCount: state.listPopularMovie.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return PosterMovie(
                    width: MediaQuery.of(context).size.width,
                    posterImage:
                        "https://image.tmdb.org/t/p/w500/${state.listPopularMovie[index].posterPath}",
                    rateMovie: state.listPopularMovie[index].voteAverage!,
                  );
                },
              );
            } else if (state.status == PopularityMovieStatus.error) {
              return const Center(child: Text('opps something went wrong : ('));
            }

            return Container();
          },
        ),
      ],
    );
  }
}
