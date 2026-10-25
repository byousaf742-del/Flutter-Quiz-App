import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
// Assuming quiz_app/views/subjects_list.dart exists for navigation
import 'package:quiz_app/views/subjects_list.dart'; // Make sure this path is correct

class ResultScreen extends StatelessWidget {
  final int userPercentage;
  final int totalRight;
  final int wrongQ;
  final int ommitedQuestion;

  const ResultScreen({
    super.key,
    required this.userPercentage,
    required this.totalRight,
    required this.wrongQ,
    required this.ommitedQuestion,
  });

  @override
  Widget build(BuildContext context) {
    // Determine the result message based on percentage
    String resultMessage;
    Color resultColor;
    if (userPercentage < 50) {
      resultMessage = "Try Again";
      resultColor = Colors.red;
    } else if (userPercentage >= 50 && userPercentage <= 99) {
      resultMessage = "You have Passed";
      resultColor = Colors.blue;
    } else {
      resultMessage = "Perfect Score!";
      resultColor = Colors.green; // Changed to green for perfect score
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Performance'), // Changed title for clarity
        centerTitle: true,
        backgroundColor: const Color(0xFF3d1860), // Consistent styling
        foregroundColor: Colors.white, // Consistent styling
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0), // Add overall padding
        child: Column(
          // Main Column to arrange elements vertically
          mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
          crossAxisAlignment: CrossAxisAlignment.center, // Center content horizontally
          children: [
            const SizedBox(height: 20),
            Text(
              resultMessage,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'TanseekModernProArabic', // Ensure this font is loaded in pubspec.yaml
                fontSize: 28, // Increased font size for emphasis
                letterSpacing: 1,
                color: resultColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30), // Increased spacing

            // Row to hold the CircularPercentIndicator and the detailed results
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Distribute space evenly
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Circular Progress Indicator
                CircularPercentIndicator(
                  radius: 80.0,
                  lineWidth: 8.0,
                  animation: true,
                  percent: userPercentage / 100, // Percentage should be 0.0 to 1.0
                  center: Text(
                    '${userPercentage}%', // Display percentage
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'TanseekModernProArabic',
                      fontSize: 24, // Adjusted font size
                      fontWeight: FontWeight.bold,
                      color: userPercentage < 60
                          ? Colors.red
                          : const Color(0xFF437B85), // Progress color
                    ),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: userPercentage < 60
                      ? Colors.red
                      : const Color(0xFF437B85), // Progress color
                  backgroundColor: const Color(0xFFE8914F), // Background track color
                ),

                // Column for detailed text results
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
                  children: [
                    Text(
                      'Your Final Score: $userPercentage%', // More precise text
                      style: TextStyle(
                        fontFamily: 'TanseekModernProArabic',
                        fontSize: 22,
                        color: userPercentage < 50 ? Colors.red : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15), // Spacing between lines

                    Text(
                      "Correct Answers: $totalRight",
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),

                    Text(
                      "Wrong Answers: $wrongQ",
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),

                    Text(
                      "Omitted Questions: $ommitedQuestion",
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40), // Spacing before the button

            // Button to restart quiz
            ElevatedButton(
              onPressed: () {
                // Navigate to SubjectListScreen and remove all previous routes
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const SubjectListScreen(),
                  ),
                      (Route<dynamic> route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                backgroundColor: const Color(0xFF643579), // Consistent button color
                foregroundColor: Colors.white, // Button text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 5,
              ),
              child: const Text(
                "Start New Quiz", // Changed text for clarity
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
