import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/auth/main_page';
import 'package:myapp/chinese_culture.dart';
import 'package:myapp/drawer.dart';// Corrected import name
import 'package:myapp/greeeting.dart';
import 'package:myapp/intropinyin.dart';
import 'package:myapp/practice.dart';
import 'package:myapp/quiz_page.dart';
import 'package:myapp/real_conv.dart';
import 'package:myapp/vocab.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    createUserDocument();
  }

  Future<void> createUserDocument() async {
    final userDoc = FirebaseFirestore.instance.collection("Users").doc(currentUser.uid);
    final userSnapshot = await userDoc.get();

    if (!userSnapshot.exists) {
      await userDoc.set({
        'email': currentUser.email,
        'username': 'New User',
        'bio': 'This is my bio',
      });
    }
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MainPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        title: const Text("A R D U I N O X"), // Corrected import name
        centerTitle: true,
        backgroundColor: Colors.pink[100],
      ),
      drawer: MyDrawer(
        onVocabPageTap: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const VocabPage()),
          );
        },
        onRealConvTap: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RealConv()),
          );
        },
        onPracticeTap: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Practice()),
          );
        },
        onQuizPageTap: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const QuizPage()),
          );
        },
        onChineseCultureTap: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ChineseCulture()),
          );
        },
        onSignOut: signOut,
      ),
      body: Center(
        child: Column(
          children: [
            Text("Logged in as: ${currentUser.email}"),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const IntroPinyinTonesPage()),
                );
              },
              child: const Text('Intro Pinyin Tones'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GreetingsCommonPhrasesPage()),
                );
              },
              child: const Text('Greetings & Common Phrases'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const VocabPage()),
                );
              },
              child: const Text('Vocab'),
            ),
          ],
        ),
      ),
    );
  }
}