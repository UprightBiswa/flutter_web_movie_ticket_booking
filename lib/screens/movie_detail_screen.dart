import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  MovieDetailScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    final TextEditingController peopleController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(movie.title, style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            Text(movie.description),
            SizedBox(height: 20),
            Text('Total People:'),
            TextField(
              controller: peopleController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter number of people',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                int totalPeople = int.tryParse(peopleController.text) ?? 1;
                Navigator.pushNamed(
                  context,
                  '/seat-selection',
                  arguments: SeatSelectionScreenArguments(
                    seatLayout: movie.seatLayout,
                    totalPeople: totalPeople,
                  ),
                );
              },
              child: Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
