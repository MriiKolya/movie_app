import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/blocs/movie_bloc/genre_movie_bloc/genres_movie_bloc.dart';
import 'package:movie_app/features/constant/constant_color.dart';

class ListGenreMovie extends StatelessWidget {
  const ListGenreMovie({super.key});

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
                'Genres',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ),
        BlocBuilder<GenresMovieBloc, GenresMovieState>(
          builder: (context, state) {
            if (state.status == GenreMovieStatus.succes) {
              return SizedBox(
                height: MediaQuery.of(context).size.height / 15,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,P
                    itemCount: state.listGenreMovie.length,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: ConstantColor.secondBackgroundcolor,
                            ),
                            child: FittedBox(
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Text(
                                  state.listGenreMovie[index].name,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ),
                            ),
                          ));
                    }),
              );
            } else if (state.status == GenreMovieStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(
                    color: ConstantColor.primaryColor),
              );
            } else if (state.status == GenreMovieStatus.error) {
              return const Center(child: Text('opps something went wrong : ('));
            }
            return Container();
          },
        )
      ],
    );
  }
}
