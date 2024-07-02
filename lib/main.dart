import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myapp/login.dart'; // Import the login page

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Use Future.delayed to navigate after 4 seconds
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage(onTap: () {  },)),
      );
    });

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 124, 9, 1), // Set the background color to red
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Spacer(), // Pushes the text and image apart
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Mandarin Mastery',
                  style: TextStyle(
                    fontFamily: 'NotoSansSC', // Use the desired font family
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20), // Space between text and image
              ],
            ),
          ),
          Image.asset('lib/assets/fox.png'), // Ensure the path is correct
        ],
      ),
    );
  }
}


