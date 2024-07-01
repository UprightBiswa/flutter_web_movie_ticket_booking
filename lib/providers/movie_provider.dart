// import 'package:flutter/material.dart';

// import '../models/movie.dart';
// import '../models/seat_layout.dart';

// class MovieProvider with ChangeNotifier {
//   final List<Movie> _movies = [
//     Movie(
//       title: 'Movie 1',
//       description: 'Description 1',
//       seatLayout: SeatLayout(
//         totalSeats: 50,
//         seatPositions: [
//           ['1', '', '2', '3', '4', '5', '6', '7', '', '8'],
//           ['9', '', '10', '11', '12', '13', '14', '15', '', '16'],
//           ['17', '', '18', '19', '20', '21', '22', '23', '', '24'],
//           ['25', '', '26', '27', '28', '29', '30', '31', '', '32'],
//           ['33', '', '34', '35', '36', '37', '38', '39', '', '40'],
//           ['41', '', '42', '43', '44', '45', '46', '47', '', '48'],
//           ['49', '50'],
//         ],
//         occupiedSeats: [1, 3, 5, 7, 9, 11, 13],
//       ),
//     ),
//     Movie(
//       title: 'Movie 2',
//       description: 'Description 2',
//       seatLayout: SeatLayout(
//         totalSeats: 50,
//         seatPositions: [
//           ['1', '2', '', '', '3', '4', '', '', '5', '6'],
//           ['7', '8', '9', '10', '11', '12', '13', '14', '15', '16'],
//           ['17', '18', '', '19', '20', '', '21', '22', '23', '24'],
//           ['25', '26', '27', '28', '29', '30', '31', '32'],
//           ['33', '34', '35', '36', '37', '38', '39', '40'],
//           ['41', '42', '43', '44', '45', '46', '47', '48'],
//           ['49', '50'],
//         ],
//         occupiedSeats: [2, 4, 6, 8, 10, 12, 14],
//       ),
//     ),
//     Movie(
//       title: 'Movie 3',
//       description: 'Description 2',
//       seatLayout: SeatLayout(
//         totalSeats: 50,
//         seatPositions: [
//           ['1', '2', '', '', '3', '4', '', '', '5', '6'],
//           ['7', '8', '9', '10', '11', '12', '13', '14', '15', '16'],
//           ['17', '18', '', '19', '20', '', '21', '22', '23', '24'],
//           ['25', '26', '27', '28', '29', '30', '31', '32'],
//           ['33', '34', '35', '36', '37', '38', '39', '40'],
//           ['41', '42', '43', '44', '45', '46', '47', '48'],
//           ['49', '50'],
//         ],
//         occupiedSeats: [2, 4, 6, 8, 10, 12, 14],
//       ),
//     ),
//     Movie(
//       title: 'Movie 4',
//       description: 'Description 2',
//       seatLayout: SeatLayout(
//         totalSeats: 50,
//         seatPositions: [
//           ['1', '2', '', '', '3', '4', '', '', '5', '6'],
//           ['7', '8', '9', '10', '11', '12', '13', '14', '15', '16'],
//           ['17', '18', '', '19', '20', '', '21', '22', '23', '24'],
//           ['25', '26', '27', '28', '29', '30', '31', '32'],
//           ['33', '34', '35', '36', '37', '38', '39', '40'],
//           ['41', '42', '43', '44', '45', '46', '47', '48'],
//           ['49', '50'],
//         ],
//         occupiedSeats: [2, 4, 6, 8, 10, 12, 14],
//       ),
//     ),
//     Movie(
//       title: 'Movie 5',
//       description: 'Description 2',
//       seatLayout: SeatLayout(
//         totalSeats: 50,
//         seatPositions: [
//           ['1', '2', '', '', '3', '4', '', '', '5', '6'],
//           ['7', '8', '9', '10', '11', '12', '13', '14', '15', '16'],
//           ['17', '18', '', '19', '20', '', '21', '22', '23', '24'],
//           ['25', '26', '27', '28', '29', '30', '31', '32'],
//           ['33', '34', '35', '36', '37', '38', '39', '40'],
//           ['41', '42', '43', '44', '45', '46', '47', '48'],
//           ['49', '50'],
//         ],
//         occupiedSeats: [2, 4, 6, 8, 10, 12, 14],
//       ),
//     ),
//     Movie(
//       title: 'Movie 6',
//       description: 'Description 2',
//       seatLayout: SeatLayout(
//         totalSeats: 50,
//         seatPositions: [
//           ['1', '2', '', '', '3', '4', '', '', '5', '6'],
//           ['7', '8', '9', '10', '11', '12', '13', '14', '15', '16'],
//           ['17', '18', '', '19', '20', '', '21', '22', '23', '24'],
//           ['25', '26', '27', '28', '29', '30', '31', '32'],
//           ['33', '34', '35', '36', '37', '38', '39', '40'],
//           ['41', '42', '43', '44', '45', '46', '47', '48'],
//           ['49', '50'],
//         ],
//         occupiedSeats: [2, 4, 6, 8, 10, 12, 14],
//       ),
//     ),
//     Movie(
//       title: 'Movie 7',
//       description: 'Description 2',
//       seatLayout: SeatLayout(
//         totalSeats: 50,
//         seatPositions: [
//           ['1', '2', '', '', '3', '4', '', '', '5', '6'],
//           ['7', '8', '9', '10', '11', '12', '13', '14', '15', '16'],
//           ['17', '18', '', '19', '20', '', '21', '22', '23', '24'],
//           ['25', '26', '27', '28', '29', '30', '31', '32'],
//           ['33', '34', '35', '36', '37', '38', '39', '40'],
//           ['41', '42', '43', '44', '45', '46', '47', '48'],
//           ['49', '50'],
//         ],
//         occupiedSeats: [2, 4, 6, 8, 10, 12, 14],
//       ),
//     ),
//     Movie(
//       title: 'Movie 8',
//       description: 'Description 2',
//       seatLayout: SeatLayout(
//         totalSeats: 50,
//         seatPositions: [
//           ['1', '2', '', '', '3', '4', '', '', '5', '6'],
//           ['7', '8', '9', '10', '11', '12', '13', '14', '15', '16'],
//           ['17', '18', '', '19', '20', '', '21', '22', '23', '24'],
//           ['25', '26', '27', '28', '29', '30', '31', '32'],
//           ['33', '34', '35', '36', '37', '38', '39', '40'],
//           ['41', '42', '43', '44', '45', '46', '47', '48'],
//           ['49', '50'],
//         ],
//         occupiedSeats: [2, 4, 6, 8, 10, 12, 14],
//       ),
//     ),
//     Movie(
//       title: 'Movie 9',
//       description: 'Description 2',
//       seatLayout: SeatLayout(
//         totalSeats: 50,
//         seatPositions: [
//           ['1', '2', '', '', '3', '4', '', '', '5', '6'],
//           ['7', '8', '9', '10', '11', '12', '13', '14', '15', '16'],
//           ['17', '18', '', '19', '20', '', '21', '22', '23', '24'],
//           ['25', '26', '27', '28', '29', '30', '31', '32'],
//           ['33', '34', '35', '36', '37', '38', '39', '40'],
//           ['41', '42', '43', '44', '45', '46', '47', '48'],
//           ['49', '50'],
//         ],
//         occupiedSeats: [2, 4, 6, 8, 10, 12, 14],
//       ),
//     ),
//     Movie(
//       title: 'Movie 10',
//       description: 'Description 2',
//       seatLayout: SeatLayout(
//         totalSeats: 50,
//         seatPositions: [
//           ['1', '2', '', '', '3', '4', '', '', '5', '6'],
//           ['7', '8', '9', '10', '11', '12', '13', '14', '15', '16'],
//           ['17', '18', '', '19', '20', '', '21', '22', '23', '24'],
//           ['25', '26', '27', '28', '29', '30', '31', '32'],
//           ['33', '34', '35', '36', '37', '38', '39', '40'],
//           ['41', '42', '43', '44', '45', '46', '47', '48'],
//           ['49', '50'],
//         ],
//         occupiedSeats: [2, 4, 6, 8, 10, 12, 14],
//       ),
//     ),
//   ];

//   List<Movie> get movies => _movies;

//   void addMovie(Movie movie) {
//     _movies.add(movie);
//     notifyListeners();
//   }
// }


import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../models/seat_layout.dart';

class MovieProvider with ChangeNotifier {
  final List<Movie> _movies = [
    Movie(
      title: 'Movie 1',
      description: 'Description 1',
      seatLayout: SeatLayout(
        sections: [
          SeatSection(
            label: 'Rs. 450 RECLINER',
            price: 450,
            seatPositions: [
              ['1', '2', '3', '4', '5', '6', '7', '8'],
              ['9', '10', '11', '12', '13', '14', '15', '16'],
            ],
            occupiedSeats: [1, 3],
          ),
          SeatSection(
            label: 'Rs. 200 PRIME',
            price: 200,
            seatPositions: [
              ['1', '2', '3', '4', '', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18'],
              ['19', '20', '21', '22'],
              // Add more rows as necessary
            ],
            occupiedSeats: [2, 4, 6],
          ),
          SeatSection(
            label: 'Rs. 180 CLASSIC',
            price: 180,
            seatPositions: [
              ['1', '2', '3', '4', '', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18'],
              ['19', '20', '21', '22'],
              // Add more rows as necessary
            ],
            occupiedSeats: [3, 5, 7],
          ),
        ],
      ),
    ),
    Movie(
      title: 'Movie 2',
      description: 'Description 2',
      seatLayout: SeatLayout(
        sections: [
          SeatSection(
            label: 'Rs. 450 RECLINER',
            price: 450,
            seatPositions: [
              ['1', '2', '3', '4', '5', '6', '7', '8'],
              ['9', '10', '11', '12', '13', '14', '15', '16'],
            ],
            occupiedSeats: [1, 3],
          ),
          SeatSection(
            label: 'Rs. 200 PRIME',
            price: 200,
            seatPositions: [
              ['1', '2', '', '', '3', '4', '', '', '5', '6'],
              ['7', '8', '9', '10', '11', '12', '13', '14', '15', '16'],
              // Add more rows as necessary
            ],
            occupiedSeats: [2, 4, 6],
          ),
          SeatSection(
            label: 'Rs. 180 CLASSIC',
            price: 180,
            seatPositions: [
              ['1', '2', '', '3', '4', '', '5', '6', '7', '8'],
              ['9', '10', '11', '12', '13', '14', '15', '16', '17', '18'],
              // Add more rows as necessary
            ],
            occupiedSeats: [3, 5, 7],
          ),
        ],
      ),
    ),
  ];

  List<Movie> get movies => _movies;

  void addMovie(Movie movie) {
    _movies.add(movie);
    notifyListeners();
  }
}
