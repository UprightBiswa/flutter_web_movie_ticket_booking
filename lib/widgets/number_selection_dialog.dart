import 'package:flutter/material.dart';

class NumberSelectionDialog extends StatefulWidget {
  final Function(int) onSelected;
  final VoidCallback? onConfirmPressed;

  const NumberSelectionDialog({
    super.key,
    required this.onSelected,
    this.onConfirmPressed,
  });

  @override
  State<NumberSelectionDialog> createState() => _NumberSelectionDialogState();
}

class _NumberSelectionDialogState extends State<NumberSelectionDialog> {
  int? selectedNumber;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Number of People'),
      content: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey), // Add a border
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                final isSelected = selectedNumber == index + 1;
                return ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedNumber = index + 1;
                    });
                    widget.onSelected(index + 1);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: isSelected ? Colors.white : Colors.black,

                    backgroundColor: isSelected
                        ? Colors.green
                        : Colors.grey, // Apply a gradient or color
                    elevation: 4, // Add a shadow
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            if (widget.onConfirmPressed != null) {
              widget.onConfirmPressed!();
            }
          },
          child: const Text('Book Now'),
        ),
      ],
    );
  }
}
