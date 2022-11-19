import 'package:demo_workshop/features/home/presentation/blocs/genre_movie/genre_movie_bloc.dart';
import 'package:demo_workshop/features/home/presentation/widgets/genred_movies_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final GenreMovieBloc genreMovieBloc = Modular.get<GenreMovieBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GenredMoviesListFrame(
                bloc: genreMovieBloc,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
