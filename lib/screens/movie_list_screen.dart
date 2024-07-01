import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movie_provider.dart';
import '../models/movie.dart';
import '../widgets/movie_card.dart';


class MovieListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Movies')),
      body: Consumer<MovieProvider>(
        builder: (context, movieProvider, child) {
          return ListView.builder(
            itemCount: movieProvider.movies.length,
            itemBuilder: (context, index) {
              Movie movie = movieProvider.movies[index];
              return MovieCard(
                movie: movie,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/movie-detail',
                    arguments: movie,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
