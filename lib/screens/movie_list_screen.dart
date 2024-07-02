import 'package:biswajit_profile_web/widgets/background.dart';
import 'package:biswajit_profile_web/widgets/footter.dart';
import 'package:biswajit_profile_web/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../providers/movie_provider.dart';
import '../models/movie.dart';
import '../widgets/hero_section.dart';
import '../widgets/movie_card.dart';
import '../widgets/suggest_movie_card.dart';

class MovieListScreen extends StatelessWidget {
  const MovieListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MediaQuery.of(context).size.width < 800
          ? Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(color: Colors.blue),
                    child: Text('Menu',
                        style: TextStyle(color: Colors.white, fontSize: 24)),
                  ),
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text('Home'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.info),
                    title: const Text('About'),
                    onTap: () {},
                  ),
                ],
              ),
            )
          : null,
      extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   elevation: 0,
      //   automaticallyImplyLeading: false,
      //   centerTitle: true,
      //   title: const Text(
      //     'Movies',
      //     style: TextStyle(
      //         color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),
      //   ),
      //   backgroundColor: Colors.transparent,
      // ),
      body: Column(
        children: [
          NavBar(),
          Expanded(
            child: Stack(
              children: [
                const Background(),
                SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const HeroSection(),
                        const SizedBox(height: 30),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: Text("Popular Now",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          height: 280,
                          child: Consumer<MovieProvider>(
                            builder: (context, movieProvider, child) {
                              return ListView.separated(
                                scrollDirection: Axis.horizontal,
                                padding: const EdgeInsets.only(left: 24),
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(width: 15),
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
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: Text("Suggested For You",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600)),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          height: 150,
                          child: Consumer<MovieProvider>(
                              builder: (context, movieProvider, child) {
                            return ListView.separated(
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.only(left: 24),
                              itemBuilder: (context, index) {
                                Movie movie = movieProvider.movies[index];

                                return SuggestedMovieCard(
                                  movie: movie,
                                );
                              },
                              physics: const BouncingScrollPhysics(),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: 15),
                              itemCount: movieProvider.movies.length,
                            );
                          }),
                        ),
                        const SizedBox(height: 30),
                        Footer(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
