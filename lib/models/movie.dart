import '../screens/seat_selection_screen.dart';
import 'seat_layout.dart';

class Movie {
  final String title;
  final String description;
  final SeatLayout seatLayout;
  final String imagePath;

  Movie({
    required this.title,
    required this.description,
    required this.seatLayout,
    required this.imagePath,
  });
}

class SeatSelectionScreenArguments {
  final SeatLayout seatLayout;
  final int totalPeople;

  SeatSelectionScreenArguments(
      {required this.seatLayout, required this.totalPeople});
}

class BillingPageArguments {
  final List<SeatSelection> selectedSeats;
  final SeatLayout seatLayout;
  final double totalPrice;

  BillingPageArguments({
    required this.selectedSeats,
    required this.seatLayout,
    required this.totalPrice,
  });
}
