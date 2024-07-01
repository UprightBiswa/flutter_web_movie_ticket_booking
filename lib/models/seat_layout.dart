// class SeatLayout {
//   final int totalSeats;
//   final List<List<String>> seatPositions;
//   final List<int> occupiedSeats;

//   SeatLayout({
//     required this.totalSeats,
//     required this.seatPositions,
//     required this.occupiedSeats,
//   });
// }



class SeatSection {
  final String label;
  final double price;
  final List<List<String>> seatPositions;
  final List<int> occupiedSeats;

  SeatSection({
    required this.label,
    required this.price,
    required this.seatPositions,
    required this.occupiedSeats,
  });
}

class SeatLayout {
  final List<SeatSection> sections;

  SeatLayout({required this.sections});
}
