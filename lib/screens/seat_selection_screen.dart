// import 'package:flutter/material.dart';

// import '../models/seat_layout.dart';

// class SeatSelectionScreen extends StatefulWidget {
//    final SeatLayout seatLayout;
//   final int totalPeople;

//   SeatSelectionScreen({required this.seatLayout, required this.totalPeople});

//   @override
//   _SeatSelectionScreenState createState() => _SeatSelectionScreenState();
// }

// class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
//   List<int> selectedSeats = [];

//   void toggleSeat(int seatNumber) {
//     setState(() {
//       if (selectedSeats.contains(seatNumber)) {
//         selectedSeats.remove(seatNumber);
//       } else if (selectedSeats.length < widget.totalPeople) {
//         selectedSeats.add(seatNumber);
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Select Seats')),
//       body: Center(
//         child: Column(
//           children: [
//             Text('Select ${widget.totalPeople} Seats', style: TextStyle(fontSize: 24)),
//             Expanded(
//               child: GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 10),
//                 itemCount: widget.seatLayout.totalSeats,
//                 itemBuilder: (context, index) {
//                    int seatNumber = index + 1;
//                   bool isOccupied = widget.seatLayout.occupiedSeats.contains(seatNumber);
//                   bool isSelected = selectedSeats.contains(seatNumber);
//                   return GestureDetector(
//                     onTap: isOccupied ? null : () => toggleSeat(seatNumber),
//                     child: Container(
//                       margin: EdgeInsets.all(4.0),
//                       color: isOccupied
//                           ? Colors.red
//                           : isSelected
//                               ? Colors.green
//                               : Colors.blue,
//                       child: Center(child: Text(seatNumber.toString())),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             ElevatedButton(
//               onPressed: selectedSeats.length == widget.totalPeople
//                   ? () {
//                       // Navigate to the next screen or perform booking
//                     }
//                   : null,
//               child: Text('Continue'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import '../models/seat_layout.dart';

// class SeatSelectionScreen extends StatefulWidget {
//   final SeatLayout seatLayout;
//   final int totalPeople;

//   SeatSelectionScreen({required this.seatLayout, required this.totalPeople});

//   @override
//   _SeatSelectionScreenState createState() => _SeatSelectionScreenState();
// }

// class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
//   List<int> selectedSeats = [];

//   void toggleSeat(int seatNumber) {
//     setState(() {
//       if (selectedSeats.contains(seatNumber)) {
//         selectedSeats.remove(seatNumber);
//       } else if (selectedSeats.length < widget.totalPeople) {
//         selectedSeats.add(seatNumber);
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Select Seats')),
//       body: Center(
//         child: Column(
//           children: [
//             Text('Select ${widget.totalPeople} Seats', style: TextStyle(fontSize: 24)),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: widget.seatLayout.seatPositions.length,
//                 itemBuilder: (context, rowIndex) {
//                   return Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: widget.seatLayout.seatPositions[rowIndex].map((seat) {
//                       if (seat == '') {
//                         return Container(
//                           width: 30,
//                           height: 30,
//                           margin: EdgeInsets.all(4.0),
//                           color: Colors.transparent,
//                         );
//                       } else {
//                         int seatNumber = int.parse(seat);
//                         bool isOccupied = widget.seatLayout.occupiedSeats.contains(seatNumber);
//                         bool isSelected = selectedSeats.contains(seatNumber);

//                         return GestureDetector(
//                           onTap: isOccupied ? null : () => toggleSeat(seatNumber),
//                           child: Container(
//                             width: 30,
//                             height: 30,
//                             margin: EdgeInsets.all(4.0),
//                             color: isOccupied
//                                 ? Colors.red
//                                 : isSelected
//                                     ? Colors.green
//                                     : Colors.blue,
//                             child: Center(child: Text(seat)),
//                           ),
//                         );
//                       }
//                     }).toList(),
//                   );
//                 },
//               ),
//             ),
//             ElevatedButton(
//               onPressed: selectedSeats.length == widget.totalPeople
//                   ? () {
//                       // Navigate to the next screen or perform booking
//                     }
//                   : null,
//               child: Text('Continue'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../models/seat_layout.dart';
import 'billing_page.dart';

class SeatSelectionScreen extends StatefulWidget {
  final SeatLayout seatLayout;
  final int totalPeople;

  const SeatSelectionScreen(
      {super.key, required this.seatLayout, required this.totalPeople});

  @override
  State<SeatSelectionScreen> createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  List<SeatSelection> selectedSeats = [];

  void toggleSeat(
      int sectionIndex, int rowIndex, int seatIndex, int seatNumber) {
    setState(() {
      SeatSelection seatSelection =
          SeatSelection(sectionIndex, rowIndex, seatIndex, seatNumber);
      if (selectedSeats.contains(seatSelection)) {
        selectedSeats.remove(seatSelection);
      } else if (selectedSeats.length < widget.totalPeople) {
        selectedSeats.add(seatSelection);
      }
    });
  }

   double calculateTotalPrice() {
    double totalPrice = 0;
    for (var seatSelection in selectedSeats) {
      final section = widget.seatLayout.sections[seatSelection.sectionIndex];
      totalPrice += section.price;
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Seats')),
      body: Center(
        child: Column(
          children: [
            Text('Select ${widget.totalPeople} Seats',
                style: TextStyle(fontSize: 24)),
            Expanded(
              child: ListView.builder(
                itemCount: widget.seatLayout.sections.length,
                itemBuilder: (context, sectionIndex) {
                  final section = widget.seatLayout.sections[sectionIndex];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${section.label} (${section.price.toString()})',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: section.seatPositions.length,
                        itemBuilder: (context, rowIndex) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: section.seatPositions[rowIndex]
                                .asMap()
                                .entries
                                .map((entry) {
                              int seatIndex = entry.key;
                              String seat = entry.value;
                              if (seat == '') {
                                return Container(
                                  width: 30,
                                  height: 30,
                                  margin: EdgeInsets.all(4.0),
                                  color: Colors.transparent,
                                );
                              } else {
                                int seatNumber = int.parse(seat);
                                bool isOccupied =
                                    section.occupiedSeats.contains(seatNumber);
                                bool isSelected = selectedSeats.contains(
                                    SeatSelection(sectionIndex, rowIndex,
                                        seatIndex, seatNumber));

                                return GestureDetector(
                                  onTap: isOccupied
                                      ? null
                                      : () => toggleSeat(sectionIndex, rowIndex,
                                          seatIndex, seatNumber),
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    margin: EdgeInsets.all(4.0),
                                    color: isOccupied
                                        ? Colors.red
                                        : isSelected
                                            ? Colors.green
                                            : Colors.blue,
                                    child: Center(child: Text(seat)),
                                  ),
                                );
                              }
                            }).toList(),
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: selectedSeats.length == widget.totalPeople
                  ? () {
                     double totalPrice = calculateTotalPrice();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BillingPage(
                            selectedSeats: selectedSeats,
                            seatLayout: widget.seatLayout,
                            totalPrice: totalPrice,
                          ),
                        ),
                      );
                    }
                  : null,
              child: Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}

class SeatSelection {
  final int sectionIndex;
  final int rowIndex;
  final int seatIndex;
  final int seatNumber;

  SeatSelection(
      this.sectionIndex, this.rowIndex, this.seatIndex, this.seatNumber);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SeatSelection &&
          runtimeType == other.runtimeType &&
          sectionIndex == other.sectionIndex &&
          rowIndex == other.rowIndex &&
          seatIndex == other.seatIndex &&
          seatNumber == other.seatNumber;

  @override
  int get hashCode =>
      sectionIndex.hashCode ^
      rowIndex.hashCode ^
      seatIndex.hashCode ^
      seatNumber.hashCode;
}
