import 'package:flutter/material.dart';

/// A custom dialog widget to display exercise notes to the user.
/// Includes a title, a close button, and a list of bullet-pointed notes.
class ExerciseNoteDialog extends StatelessWidget {
  /// Callback function to handle when the close icon is pressed.
  final VoidCallback onClose;

  const ExerciseNoteDialog({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white, // Background color of the dialog box
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16), // Rounded corners
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 24), // Inner padding
        child: Column(
          mainAxisSize: MainAxisSize.min, // Dialog height adapts to content
          children: [
            // Row with title and close button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Title
                const Text(
                  'Note:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple, // Purple-colored title
                  ),
                ),
                // Close icon (top-right)
                GestureDetector(
                  onTap: onClose, // Triggers the provided onClose function
                  child: const Icon(Icons.close, size: 24),
                ),
              ],
            ),

            const SizedBox(height: 16), // Spacing below the title row

            // Bullet point list (aligned to the left)
            const Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Each bullet point is a custom BulletText widget
                  BulletText("Exercise: 15–30 minutes of elevated heart rate activity."),
                  SizedBox(height: 8),
                  BulletText("Intense exercise: 45–120 minutes of elevated heart rate activity."),
                  SizedBox(height: 8),
                  BulletText("Very intense exercise: 2+ hours of elevated heart rate activity."),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// A helper widget that displays a single bullet point line of text.
class BulletText extends StatelessWidget {
  final String text;

  const BulletText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start, // Align bullet with text top
      children: [
        // Bullet symbol
        const Text("• ", style: TextStyle(fontSize: 16)),
        // The actual text wrapped to new lines if needed
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 15),
          ),
        ),
      ],
    );
  }
}

/// Shows the custom ExerciseNoteDialog when called from anywhere in the app.
/// Usage: Call this function with `context` to display the dialog.
void showExercisePopup(BuildContext context) {
  showDialog(
    context: context, // Required context to display the dialog
    builder: (context) => ExerciseNoteDialog(
      onClose: () => Navigator.of(context).pop(), // Close the dialog on tap
    ),
  );
}


