import 'package:flutter/material.dart';
import '../models/seat_layout.dart';
import 'seat_selection_screen.dart';

class BillingPage extends StatelessWidget {
  final List<SeatSelection> selectedSeats;
  final SeatLayout seatLayout;
  final double totalPrice;

  BillingPage({
    required this.selectedSeats,
    required this.seatLayout,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    final convenienceFee = 354.00;
    final totalAmount = totalPrice + convenienceFee;
    return Scaffold(
      appBar: AppBar(title: Text('Billing Summary')),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'BOOKING SUMMARY',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                for (var seatSelection in selectedSeats)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      '${seatLayout.sections[seatSelection.sectionIndex].label} - ${seatLayout.sections[seatSelection.sectionIndex].seatPositions[seatSelection.rowIndex][seatSelection.seatIndex]}',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                SizedBox(height: 16),
                Text(
                  'AUDI-2Rs. ${totalPrice.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Text('Convenience fees\nRs.${convenienceFee.toStringAsFixed(2)}'),
                Divider(),
                Text(
                  'Sub total\nRs.${totalAmount.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Text('Contribute to BookASmile\nRs. 0\nAdd Rs. 10'),
                Text('(₹1 per ticket has been added)\nVIEW T&C'),
                SizedBox(height: 16),
                Text('Your current state is Assam'),
                SizedBox(height: 16),
                Text(
                  'Amount Payable\nRs.${totalAmount.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Text('SELECT TICKET TYPE'),
                RadioListTile(
                  title: Text('M-Ticket'),
                  value: 'M-Ticket',
                  groupValue: 'M-Ticket',
                  onChanged: (value) {},
                ),
                RadioListTile(
                  title: Text('Box Office Pickup'),
                  value: 'Box Office Pickup',
                  groupValue: 'M-Ticket',
                  onChanged: (value) {},
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Perform booking
                  },
                  child: Text('Proceed'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
