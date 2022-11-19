import 'package:demo_workshop/features/home/presentation/widgets/genred_movies_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../base/widgets/shimmer.dart';
import '../blocs/genre_movie/genre_movie_bloc.dart';

class GenredMoviesListFrame extends StatelessWidget {
  const GenredMoviesListFrame({
    Key? key,
    required this.bloc,
  }) : super(key: key);

  final GenreMovieBloc bloc;

  @override
  Widget build(BuildContext context) =>
      BlocListener<GenreMovieBloc, GenreMovieState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is GenreMovieErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.error.message ?? 'error'),
            ));
          }
        },
        child: BlocBuilder<GenreMovieBloc, GenreMovieState>(
            bloc: bloc..add(const GenreMovieLoadEvent()),
            buildWhen: (previous, current) => current is GenreMovieDoneState,
            builder: (context, state) {
              if (state is GenreMovieDoneState) {
                return SizedBox(
                  height: 276,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.movies.length,
                      itemBuilder: (context, index) => GenredMovieItem(
                            item: state.movies[index],
                          )),
                );
              }
              return SizedBox(
                height: 276,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: MyShimmer.shimmerBuilder(
                                child: Container(
                              color: Colors.white,
                              height: 180,
                              width: 120,
                            ))),
                        const SizedBox(height: 8.0),
                        SizedBox(
                            width: 120,
                            height: 32,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyShimmer.shimmerBuilder(
                                    child: Container(
                                  color: Colors.white,
                                  height: 14.0,
                                  width: 120,
                                )),
                                const SizedBox(
                                  height: 2.0,
                                ),
                                MyShimmer.shimmerBuilder(
                                    child: Container(
                                  color: Colors.white,
                                  height: 14.0,
                                  width: 80,
                                ))
                              ],
                            )),
                        const SizedBox(height: 8.0),
                        MyShimmer.shimmerBuilder(
                            child: Container(
                          color: Colors.white,
                          height: 14.0,
                          width: 80,
                        )),
                      ],
                    ),
                  ),
                ),
              );
            }),
      );
}
