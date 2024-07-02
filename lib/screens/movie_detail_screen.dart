import 'package:flutter/material.dart';
import '../models/movie.dart';

import '../widgets/background.dart';
import '../widgets/footter.dart';
import '../widgets/move_detils_top_section.dart';
import '../widgets/movie_details_widget.dart';
import '../widgets/navbar.dart';
import '../widgets/number_selection_dialog.dart';

class MovieDetailScreen extends StatefulWidget {
  final Movie movie;

  const MovieDetailScreen({super.key, required this.movie});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  int? selectedNumber;

  void _showNumberSelectionDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return NumberSelectionDialog(
          onSelected: (number) {
            setState(() {
              selectedNumber = number;
            });
          },
          onConfirmPressed: () {
            Navigator.pushNamed(
              context,
              '/seat-selection',
              arguments: SeatSelectionScreenArguments(
                seatLayout: widget.movie.seatLayout,
                totalPeople: selectedNumber!,
              ),
            );
          },
        );
      },
    );
  }

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
                          movie: widget.movie,
                          onPressed: _showNumberSelectionDialog,
                        ),
                        const SizedBox(height: 30),
                        const MovieDetailsWidget(),
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
