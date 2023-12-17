import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/blocs/movie_bloc/top_reted_movie_bloc.dart/top_rated_movie_bloc.dart';
import 'package:movie_app/features/constant/constant_color.dart';
import 'package:movie_app/features/screens/main/dashboard/widgets/poster_movie_widget.dart';

class ListTopRatesMovie extends StatelessWidget {
  const ListTopRatesMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Top Rated',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'See all',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: ConstantColor.primaryColor),
              ),
            ],
          ),
        ),
        BlocBuilder<TopRatedMovieBloc, TopRatedMovieState>(
          builder: (context, state) {
            if (state.status == TopRatedMovieStatus.succes) {
              return SizedBox(
                height: MediaQuery.of(context).size.height / 4,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.listTopRatedMovie.length,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: PosterMovie(
                            posterImage: state
                                .listTopRatedMovie[index].fullImagePosterPath,
                            rateMovie:
                                state.listTopRatedMovie[index].voteAverage!,
                            width: MediaQuery.of(context).size.width / 3,
                          ));
                    }),
              );
            } else if (state.status == TopRatedMovieStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(
                    color: ConstantColor.primaryColor),
              );
            } else if (state.status == TopRatedMovieStatus.error) {
              return const Center(child: Text('opps something went wrong : ('));
            }
            return Container();
          },
        )
      ],
    );
  }
}
