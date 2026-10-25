import 'package:flutter/material.dart';
import 'package:quiz_app/views/subjects_list.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  // Controller to get text from the name input field
  final TextEditingController _nameController = TextEditingController();
  // Variable to store the greeting message, initially empty
  String _greetingMessage = 'Are You Ready?';

  @override
  void initState() {
    super.initState();
    // Add a listener to the text controller to update the greeting as the user types
    _nameController.addListener(_updateGreeting);
  }

  @override
  void dispose() {
    // Dispose the controller when the widget is removed to prevent memory leaks
    _nameController.dispose();
    super.dispose();
  }

  // Function to update the greeting message based on the entered name
  void _updateGreeting() {
    setState(() {
      // If the name field is not empty, show "Hello, [Name]!"
      if (_nameController.text.isNotEmpty) {
        _greetingMessage = 'lets Go, ${_nameController.text}!';
      } else {
        // If the name field is empty, revert to the default greeting
        _greetingMessage = 'Are You Ready?';
      }
    });
  }

  // Function to handle the "Go" button press
  void _goToNextScreen() {
    // Check if a name has been entered
    if (_nameController.text.isEmpty) {
      // Show a simple snackbar message if the name is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please enter your name to proceed!'),
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.redAccent,
        ),
      );
    } else {
      // Navigate to the QuizScreenPlaceholder, passing the entered name
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SubjectListScreen(/*userName: _nameController.text*/),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome Students!'),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView( // Allows content to scroll if keyboard appears
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Greeting Message
              Text(
                _greetingMessage,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(height: 40),

              // Name Input Field
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Enter your name',
                  hintText: 'e.g., Bilal Yousaf',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.person),
                  filled: true,
                  fillColor: Colors.blue.shade50,
                ),
                keyboardType: TextInputType.name,
                textCapitalization: TextCapitalization.words, // Capitalize first letter of each word
              ),
              const SizedBox(height: 30),

              // "Go" Button
              ElevatedButton(
                onPressed: _goToNextScreen, // Call the navigation function
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5, // Add a subtle shadow
                ),
                child: const Text(
                  'Go to Quiz!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
