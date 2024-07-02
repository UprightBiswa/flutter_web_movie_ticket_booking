import 'package:flutter/material.dart';
import '../models/movie.dart';

import '../widgets/background.dart';
import '../widgets/footter.dart';
import '../widgets/move_detils_top_section.dart';
import '../widgets/movie_details_widget.dart';
import '../widgets/navbar.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final TextEditingController peopleController = TextEditingController();

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
                    onTap: () {
                      Navigator.pushNamed(context, '/home');
                    },
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MovieDetailsTopSection(
                          movie: movie,
                        ),
                        const SizedBox(height: 30),
                        const MovieDetailsWidget(),
                        const SizedBox(height: 30),
                        const Text(
                          'Total People:',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: peopleController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter number of people',
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            int totalPeople =
                                int.tryParse(peopleController.text) ?? 1;
                            Navigator.pushNamed(
                              context,
                              '/seat-selection',
                              arguments: SeatSelectionScreenArguments(
                                seatLayout: movie.seatLayout,
                                totalPeople: totalPeople,
                              ),
                            );
                          },
                          child: const Text('Book Tickets'),
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
