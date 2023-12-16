import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/blocs/movie_bloc/upcoming_movie_bloc/upcoming_movie_bloc.dart';
import 'package:movie_app/features/constant/constant.dart';
import 'package:movie_app/features/screens/main/dashboard/widgets/poster_movie_widget.dart';

class ListUpcomingMovie extends StatelessWidget {
  const ListUpcomingMovie({super.key});

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
                'Upcoming',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'See all',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Constant.primaryColor),
              ),
            ],
          ),
        ),
        BlocBuilder<UpcomingMovieBloc, UpcomingMovieState>(
          builder: (context, state) {
            if (state.status == UpcomingMovieStatus.succes) {
              return SizedBox(
                height: MediaQuery.of(context).size.height / 4,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: PosterMovie(
                            posterImage:
                                'https://image.tmdb.org/t/p/w500/${state.listUpcomingMovie[index].posterPath}',
                            rateMovie:
                                state.listUpcomingMovie[index].voteAverage!,
                            width: MediaQuery.of(context).size.width / 3,
                          ));
                    }),
              );
            } else if (state.status == UpcomingMovieStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.status == UpcomingMovieStatus.error) {
              return const Center(child: Text('opps something went wrong : ('));
            }
            return Container();
          },
        )
      ],
    );
  }
}
