// import 'package:flutter/material.dart';
// import '../models/seat_layout.dart';
// import 'billing_page.dart';

// class SeatSelectionScreen extends StatefulWidget {
//   final SeatLayout seatLayout;
//   final int totalPeople;

//   const SeatSelectionScreen(
//       {super.key, required this.seatLayout, required this.totalPeople});

//   @override
//   State<SeatSelectionScreen> createState() => _SeatSelectionScreenState();
// }

// class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
//   List<SeatSelection> selectedSeats = [];

//   void toggleSeat(
//       int sectionIndex, int rowIndex, int seatIndex, int seatNumber) {
//     setState(() {
//       SeatSelection seatSelection =
//           SeatSelection(sectionIndex, rowIndex, seatIndex, seatNumber);
//       if (selectedSeats.contains(seatSelection)) {
//         selectedSeats.remove(seatSelection);
//       } else if (selectedSeats.length < widget.totalPeople) {
//         selectedSeats.add(seatSelection);
//       }
//     });
//   }

//    double calculateTotalPrice() {
//     double totalPrice = 0;
//     for (var seatSelection in selectedSeats) {
//       final section = widget.seatLayout.sections[seatSelection.sectionIndex];
//       totalPrice += section.price;
//     }
//     return totalPrice;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Select Seats')),
//       body: Center(
//         child: Column(
//           children: [
//             Text('Select ${widget.totalPeople} Seats',
//                 style: TextStyle(fontSize: 24)),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: widget.seatLayout.sections.length,
//                 itemBuilder: (context, sectionIndex) {
//                   final section = widget.seatLayout.sections[sectionIndex];
//                   return Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         '${section.label} (${section.price.toString()})',
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold),
//                       ),
//                       ListView.builder(
//                         shrinkWrap: true,
//                         physics: NeverScrollableScrollPhysics(),
//                         itemCount: section.seatPositions.length,
//                         itemBuilder: (context, rowIndex) {
//                           return Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: section.seatPositions[rowIndex]
//                                 .asMap()
//                                 .entries
//                                 .map((entry) {
//                               int seatIndex = entry.key;
//                               String seat = entry.value;
//                               if (seat == '') {
//                                 return Container(
//                                   width: 30,
//                                   height: 30,
//                                   margin: EdgeInsets.all(4.0),
//                                   color: Colors.transparent,
//                                 );
//                               } else {
//                                 int seatNumber = int.parse(seat);
//                                 bool isOccupied =
//                                     section.occupiedSeats.contains(seatNumber);
//                                 bool isSelected = selectedSeats.contains(
//                                     SeatSelection(sectionIndex, rowIndex,
//                                         seatIndex, seatNumber));

//                                 return GestureDetector(
//                                   onTap: isOccupied
//                                       ? null
//                                       : () => toggleSeat(sectionIndex, rowIndex,
//                                           seatIndex, seatNumber),
//                                   child: Container(
//                                     width: 30,
//                                     height: 30,
//                                     margin: EdgeInsets.all(4.0),
//                                     color: isOccupied
//                                         ? Colors.red
//                                         : isSelected
//                                             ? Colors.green
//                                             : Colors.blue,
//                                     child: Center(child: Text(seat)),
//                                   ),
//                                 );
//                               }
//                             }).toList(),
//                           );
//                         },
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             ),
//             ElevatedButton(
//               onPressed: selectedSeats.length == widget.totalPeople
//                   ? () {
//                      double totalPrice = calculateTotalPrice();
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => BillingPage(
//                             selectedSeats: selectedSeats,
//                             seatLayout: widget.seatLayout,
//                             totalPrice: totalPrice,
//                           ),
//                         ),
//                       );
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

// class SeatSelection {
//   final int sectionIndex;
//   final int rowIndex;
//   final int seatIndex;
//   final int seatNumber;

//   SeatSelection(
//       this.sectionIndex, this.rowIndex, this.seatIndex, this.seatNumber);

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is SeatSelection &&
//           runtimeType == other.runtimeType &&
//           sectionIndex == other.sectionIndex &&
//           rowIndex == other.rowIndex &&
//           seatIndex == other.seatIndex &&
//           seatNumber == other.seatNumber;

//   @override
//   int get hashCode =>
//       sectionIndex.hashCode ^
//       rowIndex.hashCode ^
//       seatIndex.hashCode ^
//       seatNumber.hashCode;
// }

import 'dart:math';

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

  // void toggleSeat(
  //     int sectionIndex, int rowIndex, int seatIndex, int seatNumber) {
  //   setState(() {
  //     SeatSelection seatSelection =
  //         SeatSelection(sectionIndex, rowIndex, seatIndex, seatNumber);
  //     if (selectedSeats.contains(seatSelection)) {
  //       selectedSeats.remove(seatSelection);
  //     } else if (selectedSeats.length < widget.totalPeople) {
  //       selectedSeats.add(seatSelection);
  //     }
  //   });
  // }

  // void toggleSeat(
  //     int sectionIndex, int rowIndex, int seatIndex, int seatNumber) {
  //   setState(() {
  //     // Deselect the seat if already selected
  //     SeatSelection seatSelection =
  //         SeatSelection(sectionIndex, rowIndex, seatIndex, seatNumber);
  //     if (selectedSeats.contains(seatSelection)) {
  //       selectedSeats.remove(seatSelection);
  //     } else if (selectedSeats.length < widget.totalPeople) {
  //       List<SeatSelection> newSelections = [];

  //       // Check the seats to the right of the selected seat
  //       for (int i = seatIndex;
  //           i <
  //               widget.seatLayout.sections[sectionIndex].seatPositions[rowIndex]
  //                   .length;
  //           i++) {
  //         String seat = widget
  //             .seatLayout.sections[sectionIndex].seatPositions[rowIndex][i];
  //         if (seat == '') break; // Stop if there's an empty space
  //         int seatNumber = int.parse(seat);
  //         if (widget.seatLayout.sections[sectionIndex].occupiedSeats
  //             .contains(seatNumber)) break; // Stop if the seat is occupied
  //         newSelections
  //             .add(SeatSelection(sectionIndex, rowIndex, i, seatNumber));
  //         if (newSelections.length == widget.totalPeople) break;
  //       }

  //       // If not enough seats, check the seats to the left of the selected seat
  //       if (newSelections.length < widget.totalPeople) {
  //         newSelections.clear();
  //         for (int i = seatIndex; i >= 0; i--) {
  //           String seat = widget
  //               .seatLayout.sections[sectionIndex].seatPositions[rowIndex][i];
  //           if (seat == '') break; // Stop if there's an empty space
  //           int seatNumber = int.parse(seat);
  //           if (widget.seatLayout.sections[sectionIndex].occupiedSeats
  //               .contains(seatNumber)) break; // Stop if the seat is occupied
  //           newSelections
  //               .add(SeatSelection(sectionIndex, rowIndex, i, seatNumber));
  //           if (newSelections.length == widget.totalPeople) break;
  //         }
  //       }

  //       // Add the new selections to the selected seats
  //       for (SeatSelection selection in newSelections) {
  //         if (!selectedSeats.contains(selection) &&
  //             selectedSeats.length < widget.totalPeople) {
  //           selectedSeats.add(selection);
  //         }
  //       }
  //     }
  //   });
  // }

  // void toggleSeat(
  //     int sectionIndex, int rowIndex, int seatIndex, int seatNumber) {
  //   setState(() {
  //     SeatSelection seatSelection =
  //         SeatSelection(sectionIndex, rowIndex, seatIndex, seatNumber);

  //     if (selectedSeats.contains(seatSelection)) {
  //       selectedSeats.remove(seatSelection);
  //     } else if (selectedSeats.length < widget.totalPeople) {
  //       // Check if there are enough seats to the right
  //       List<SeatSelection> newSelections = [];
  //       for (int i = seatIndex;
  //           i <
  //               widget.seatLayout.sections[sectionIndex].seatPositions[rowIndex]
  //                   .length;
  //           i++) {
  //         String seat = widget
  //             .seatLayout.sections[sectionIndex].seatPositions[rowIndex][i];
  //         if (seat == '') break; // Stop if there's an empty space
  //         int seatNumber = int.parse(seat);
  //         if (widget.seatLayout.sections[sectionIndex].occupiedSeats
  //             .contains(seatNumber)) break; // Stop if the seat is occupied
  //         newSelections
  //             .add(SeatSelection(sectionIndex, rowIndex, i, seatNumber));
  //         if (newSelections.length == widget.totalPeople) break;
  //       }

  //       // If not enough seats to the right, check the seats to the left
  //       if (newSelections.length < widget.totalPeople) {
  //         newSelections.clear();
  //         for (int i = seatIndex; i >= 0; i--) {
  //           String seat = widget
  //               .seatLayout.sections[sectionIndex].seatPositions[rowIndex][i];
  //           if (seat == '') break; // Stop if there's an empty space
  //           int seatNumber = int.parse(seat);
  //           if (widget.seatLayout.sections[sectionIndex].occupiedSeats
  //               .contains(seatNumber)) break; // Stop if the seat is occupied
  //           newSelections
  //               .add(SeatSelection(sectionIndex, rowIndex, i, seatNumber));
  //           if (newSelections.length == widget.totalPeople) break;
  //         }
  //       }

  //       // Add the new selections to the selected seats
  //       for (SeatSelection selection in newSelections) {
  //         if (!selectedSeats.contains(selection) &&
  //             selectedSeats.length < widget.totalPeople) {
  //           selectedSeats.add(selection);
  //         }
  //       }
  //     } else {
  //       // Clear the selection and start a new selection
  //       selectedSeats.clear();
  //       List<SeatSelection> newSelections = [];

  //       // Check the seats to the right of the selected seat
  //       for (int i = seatIndex;
  //           i <
  //               widget.seatLayout.sections[sectionIndex].seatPositions[rowIndex]
  //                   .length;
  //           i++) {
  //         String seat = widget
  //             .seatLayout.sections[sectionIndex].seatPositions[rowIndex][i];
  //         if (seat == '') break; // Stop if there's an empty space
  //         int seatNumber = int.parse(seat);
  //         if (widget.seatLayout.sections[sectionIndex].occupiedSeats
  //             .contains(seatNumber)) break; // Stop if the seat is occupied
  //         newSelections
  //             .add(SeatSelection(sectionIndex, rowIndex, i, seatNumber));
  //         if (newSelections.length == widget.totalPeople) break;
  //       }

  //       // If not enough seats, check the seats to the left of the selected seat
  //       if (newSelections.length < widget.totalPeople) {
  //         newSelections.clear();
  //         for (int i = seatIndex; i >= 0; i--) {
  //           String seat = widget
  //               .seatLayout.sections[sectionIndex].seatPositions[rowIndex][i];
  //           if (seat == '') break; // Stop if there's an empty space
  //           int seatNumber = int.parse(seat);
  //           if (widget.seatLayout.sections[sectionIndex].occupiedSeats
  //               .contains(seatNumber)) break; // Stop if the seat is occupied
  //           newSelections
  //               .add(SeatSelection(sectionIndex, rowIndex, i, seatNumber));
  //           if (newSelections.length == widget.totalPeople) break;
  //         }
  //       }

  //       // Add the new selections to the selected seats
  //       for (SeatSelection selection in newSelections) {
  //         if (!selectedSeats.contains(selection) &&
  //             selectedSeats.length < widget.totalPeople) {
  //           selectedSeats.add(selection);
  //         }
  //       }
  //     }
  //   });
  // }

  // void toggleSeat(
  //     int sectionIndex, int rowIndex, int seatIndex, int seatNumber) {
  //   setState(() {
  //     SeatSelection seatSelection =
  //         SeatSelection(sectionIndex, rowIndex, seatIndex, seatNumber);

  //     if (selectedSeats.contains(seatSelection)) {
  //       selectedSeats.remove(seatSelection);
  //     } else {
  //       if (selectedSeats.length == widget.totalPeople) {
  //         // Clear old selections if the user toggles a new index when all required seats are already selected
  //         selectedSeats.clear();
  //       }

  //       // Check the seats to the right of the selected seat
  //       List<SeatSelection> newSelections = [];
  //       for (int i = seatIndex;
  //           i <
  //               widget.seatLayout.sections[sectionIndex].seatPositions[rowIndex]
  //                   .length;
  //           i++) {
  //         String seat = widget
  //             .seatLayout.sections[sectionIndex].seatPositions[rowIndex][i];
  //         if (seat == '') break; // Stop if there's an empty space
  //         int seatNumber = int.parse(seat);
  //         if (widget.seatLayout.sections[sectionIndex].occupiedSeats
  //             .contains(seatNumber)) break; // Stop if the seat is occupied
  //         newSelections
  //             .add(SeatSelection(sectionIndex, rowIndex, i, seatNumber));
  //         if (newSelections.length == widget.totalPeople) break;
  //       }

  //       // If not enough seats, check the seats to the left of the selected seat
  //       if (newSelections.length < widget.totalPeople) {
  //         newSelections.clear();
  //         for (int i = seatIndex; i >= 0; i--) {
  //           String seat = widget
  //               .seatLayout.sections[sectionIndex].seatPositions[rowIndex][i];
  //           if (seat == '') break; // Stop if there's an empty space
  //           int seatNumber = int.parse(seat);
  //           if (widget.seatLayout.sections[sectionIndex].occupiedSeats
  //               .contains(seatNumber)) break; // Stop if the seat is occupied
  //           newSelections
  //               .add(SeatSelection(sectionIndex, rowIndex, i, seatNumber));
  //           if (newSelections.length == widget.totalPeople) break;
  //         }
  //       }

  //       // Add the new selections to the selected seats
  //       for (SeatSelection selection in newSelections) {
  //         if (!selectedSeats.contains(selection) &&
  //             selectedSeats.length < widget.totalPeople) {
  //           selectedSeats.add(selection);
  //         }
  //       }
  //     }
  //   });
  // }

  void toggleSeat(
      int sectionIndex, int rowIndex, int seatIndex, int seatNumber) {
    setState(() {
      SeatSelection seatSelection =
          SeatSelection(sectionIndex, rowIndex, seatIndex, seatNumber);

      if (selectedSeats.contains(seatSelection)) {
        selectedSeats.remove(seatSelection);
      } else {
        // If total selected seats already match the total people, clear old selections
        if (selectedSeats.length >= widget.totalPeople) {
          selectedSeats.clear();
        }

        // Check the seats to the right of the selected seat
        List<SeatSelection> newSelections = [];
        for (int i = seatIndex;
            i <
                widget.seatLayout.sections[sectionIndex].seatPositions[rowIndex]
                    .length;
            i++) {
          String seat = widget
              .seatLayout.sections[sectionIndex].seatPositions[rowIndex][i];
          if (seat == '') break; // Stop if there's an empty space
          int seatNumber = int.parse(seat);
          if (widget.seatLayout.sections[sectionIndex].occupiedSeats
              .contains(seatNumber)) break; // Stop if the seat is occupied
          newSelections
              .add(SeatSelection(sectionIndex, rowIndex, i, seatNumber));
          if (newSelections.length == widget.totalPeople) break;
        }

        // If not enough seats to the right, check the seats to the left of the selected seat
        if (newSelections.length < widget.totalPeople) {
          for (int i = seatIndex - 1; i >= 0; i--) {
            String seat = widget
                .seatLayout.sections[sectionIndex].seatPositions[rowIndex][i];
            if (seat == '') break; // Stop if there's an empty space
            int seatNumber = int.parse(seat);
            if (widget.seatLayout.sections[sectionIndex].occupiedSeats
                .contains(seatNumber)) break; // Stop if the seat is occupied
            newSelections
                .add(SeatSelection(sectionIndex, rowIndex, i, seatNumber));
            if (newSelections.length == widget.totalPeople) break;
          }
        }

        // If still not enough seats, find remaining seats from other rows
        if (newSelections.length < widget.totalPeople) {
          for (int r = 0;
              r < widget.seatLayout.sections[sectionIndex].seatPositions.length;
              r++) {
            for (int i = 0;
                i <
                    widget.seatLayout.sections[sectionIndex].seatPositions[r]
                        .length;
                i++) {
              String seat =
                  widget.seatLayout.sections[sectionIndex].seatPositions[r][i];
              if (seat == '') break; // Stop if there's an empty space
              int seatNumber = int.parse(seat);
              if (widget.seatLayout.sections[sectionIndex].occupiedSeats
                  .contains(seatNumber)) continue; // Skip occupied seats
              newSelections.add(SeatSelection(sectionIndex, r, i, seatNumber));
              if (newSelections.length == widget.totalPeople) break;
            }
            if (newSelections.length == widget.totalPeople) break;
          }
        }

        // Add the new selections to the selected seats
        selectedSeats.clear(); // Clear the old selections
        for (SeatSelection selection in newSelections) {
          if (!selectedSeats.contains(selection) &&
              selectedSeats.length < widget.totalPeople) {
            selectedSeats.add(selection);
          }
        }
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
            Text(
              'Select ${widget.totalPeople} Seats',
              style: const TextStyle(fontSize: 24),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        for (int sectionIndex = 0;
                            sectionIndex < widget.seatLayout.sections.length;
                            sectionIndex++)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Text(
                              //   '${widget.seatLayout.sections[sectionIndex].label} (${widget.seatLayout.sections[sectionIndex].price.toString()})',
                              //   style: const TextStyle(
                              //       fontSize: 12, fontWeight: FontWeight.w100),
                              // ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  '${String.fromCharCode(65 + sectionIndex)} - ${widget.seatLayout.sections[sectionIndex].label} (${widget.seatLayout.sections[sectionIndex].price.toString()})',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              SizedBox(
                                height: 1,
                                child: Container(
                                  color: Colors.white,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                ),
                              ),
                              const SizedBox(height: 8),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Column(
                                  children: [
                                    for (int rowIndex = 0;
                                        rowIndex <
                                            widget
                                                .seatLayout
                                                .sections[sectionIndex]
                                                .seatPositions
                                                .length;
                                        rowIndex++)
                                      Row(
                                        children: [
                                          Text(
                                            String.fromCharCode(65 + rowIndex),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: widget
                                                .seatLayout
                                                .sections[sectionIndex]
                                                .seatPositions[rowIndex]
                                                .asMap()
                                                .entries
                                                .map((entry) {
                                              int seatIndex = entry.key;
                                              String seat = entry.value;
                                              if (seat == '') {
                                                return Container(
                                                  width: 30,
                                                  height: 30,
                                                  margin:
                                                      const EdgeInsets.all(4.0),
                                                  color: Colors.transparent,
                                                );
                                              } else {
                                                int seatNumber =
                                                    int.parse(seat);
                                                bool isOccupied = widget
                                                    .seatLayout
                                                    .sections[sectionIndex]
                                                    .occupiedSeats
                                                    .contains(seatNumber);
                                                bool isSelected = selectedSeats
                                                    .contains(SeatSelection(
                                                        sectionIndex,
                                                        rowIndex,
                                                        seatIndex,
                                                        seatNumber));

                                                return GestureDetector(
                                                  onTap: isOccupied
                                                      ? null
                                                      : () => toggleSeat(
                                                          sectionIndex,
                                                          rowIndex,
                                                          seatIndex,
                                                          seatNumber),
                                                  child: Container(
                                                    width: 30,
                                                    height: 30,
                                                    margin:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    decoration: BoxDecoration(
                                                      color: isOccupied
                                                          ? Colors.red
                                                          : isSelected
                                                              ? Colors.green
                                                              : Colors.blue,
                                                      border: isSelected
                                                          ? Border.all(
                                                              color:
                                                                  Colors.black,
                                                              width: 2.0,
                                                            )
                                                          : null,
                                                      boxShadow: isSelected
                                                          ? [
                                                              BoxShadow(
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.5),
                                                                spreadRadius: 1,
                                                                blurRadius: 5,
                                                                offset: Offset(
                                                                    0, 3),
                                                              ),
                                                            ]
                                                          : [],
                                                    ),
                                                    child: Center(
                                                        child: Text(seat)),
                                                  ),
                                                );
                                              }
                                            }).toList(),
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                              SizedBox(
                                height: 1,
                                child: Container(
                                  color: Colors.white,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                ),
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                        _buildScreenShape(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Total Price: \$${calculateTotalPrice().toStringAsFixed(2)}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              child: ElevatedButton(
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
                child: const Text('Proceed to Billing'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScreenShape() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 16.0),
          height: 100,
          // decoration: BoxDecoration(
          //   color: Colors.white,
          //   border: Border.all(color: Colors.grey.shade900, width: 4),
          //   boxShadow: [
          //     BoxShadow(
          //       color: Colors.grey.shade700,
          //       blurRadius: 10.0,
          //       offset: Offset(0, 4),
          //     ),
          //   ],
          // ),
          child: CustomPaint(
              painter: ScreenShapePainter(),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.25,
              )),
        ),
        Text(
          'All eyes this way please!',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class ScreenShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = RadialGradient(
        colors: [Colors.blue.shade300, Colors.purple.shade700],
        center: Alignment.center,
        radius: 1.0,
      ).createShader(Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.height / 2,
      ));
    final borderPaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;
    final path = Path();
    // Top side
    path.moveTo(size.width * 0.25, 0);
    path.lineTo(size.width * 0.75, 0);

    // Right side
    path.lineTo(size.width, size.height);

    // Bottom side
    path.lineTo(0, size.height);

    // Left side
    path.close();

    // ..moveTo(0, 0)
    // ..lineTo(size.width, size.height * 0.5)
    // ..lineTo(size.width * 0.5, size.height)
    // ..lineTo(0, size.height * 0.5)
    // ..close();

    canvas.drawPath(path, paint);
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
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
