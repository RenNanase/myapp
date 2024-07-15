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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Use Future.delayed to navigate after 6 seconds (changed from 4 to 6 seconds)
    Future.delayed(const Duration(seconds: 6), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage(onTap: () {})),
      );
    });

    return Scaffold(
      backgroundColor: Colors.pink[50], // Set the background color to pink[50]
      body: const Center(
        child: Text(
          'Mandarin Mastery',
          style: TextStyle(
            fontFamily: 'BebasNeue-Regular', // Change to your desired font type
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.black, // Set the text color to black for better contrast
          ),
        ),
      ),
    );
  }
}
