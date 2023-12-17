import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/blocs/movie_bloc/popular_actor_movie_bloc/popular_actor_movie_bloc.dart';
import 'package:movie_app/features/constant/constant_color.dart';

class ListPopularActorMovie extends StatelessWidget {
  const ListPopularActorMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          child: Text(
            'Popular actor',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        BlocBuilder<PopularActorMovieBloc, PopularActorMovieState>(
          builder: (context, state) {
            if (state.status == PopularActorMovieStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: ConstantColor.primaryColor,
                ),
              );
            } else if (state.status == PopularActorMovieStatus.succes) {
              return CarouselSlider.builder(
                options: CarouselOptions(
                  aspectRatio: 4 / 2,
                  enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                  enableInfiniteScroll: true,
                  height: MediaQuery.of(context).size.height / 6,
                  viewportFraction: 0.3,
                  autoPlay: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                ),
                itemCount: state.listPopularMovieActor.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(state
                            .listPopularMovieActor[index].fullImageProfilePath),
                        radius: 40,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        state.listPopularMovieActor[index].name.toString(),
                        textAlign: TextAlign.center,
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      )
                    ],
                  );
                },
              );
            } else if (state.status == PopularActorMovieStatus.error) {
              return const Center(child: Text('opps something went wrong : ('));
            }

            return Container();
          },
        ),
      ],
    );
  }
}
