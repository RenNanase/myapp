import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/auth/main_page.';
import 'package:myapp/chinese_phrase.dart';
import 'package:myapp/drawer.dart';
import 'package:myapp/infographic.dart';
import 'package:myapp/intropinyin.dart';
import 'package:myapp/minigames.dart';
import 'package:myapp/quiz_page.dart';
import 'package:myapp/vocabularytype.dart';
import 'package:myapp/vocabulary.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  final textController = TextEditingController();
  final Map<String, bool> selectedCards = {};

  @override
  void initState() {
    super.initState();
    checkUserAuthentication();
  }

  Future<void> checkUserAuthentication() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
      );
    } else {
      await createUserDocument(user);
    }
  }

  Future<void> createUserDocument(User user) async {
    final userDoc =
    FirebaseFirestore.instance.collection("Users").doc(user.uid);
    final userSnapshot = await userDoc.get();

    if (!userSnapshot.exists) {
      await userDoc.set({
        'email': user.email,
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

  void toggleCardSelection(String cardTitle, VoidCallback onTap) {
    setState(() {
      selectedCards[cardTitle] = true;
    });
    onTap();
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        selectedCards[cardTitle] = false;
      });
    });
  }

  void viewLargeImage(String imagePath) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.pink[100],
          ),
          body: Center(
            child: Image.asset(imagePath),
          ),
        ),
      ),
    );
  }

  Widget buildCustomCard(
      String title, String imagePath, VoidCallback onTap, BuildContext context) {
    bool isSelected = selectedCards[title] ?? false;
    return GestureDetector(
      onTap: () {
        if (title == 'P I N Y I N  &  T O N E S') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PinyinTones()),
          );
        } else {
          toggleCardSelection(title, onTap);
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            color: isSelected ? Colors.pink : Colors.transparent,
            width: 1.0, // Thinner border
          ),
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => viewLargeImage(imagePath),
              child: Image.asset(imagePath, height: 100),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.pink,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        title: const Text("M A N D A R I N  M A S T E R Y"),
        centerTitle: true,
        backgroundColor: Colors.pink[100],
      ),
      drawer: MyDrawer(
        onVocabularyTap: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const VocabularyPage()),
          );
        },
        onQuizPageTap: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => QuizPage()),
          );
        },
        onMiniGamesTap: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MiniGames()),
          );
        },
        onInfographicTap: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Infographic()),
          );
        },
        onSignOut: signOut,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildCustomCard(
                    'P I N Y I N  &  T O N E S',
                    'lib/assets/fox.png', // Replace with actual image path
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PinyinTones()),
                      );
                    },
                    context,
                  ),
                  buildCustomCard(
                    'U S E F U L  E X P R E S S I O N S',
                    'lib/assets/fox.png', // Replace with actual image path
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VocabularyApp()),
                      );
                    },
                    context,
                  ),
                  buildCustomCard(
                    'P H R A S E S',
                    'lib/assets/fox.png', // Replace with actual image path
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ChinesePhrase()),
                      );
                    },
                    context,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Logged in as: ${currentUser.email}",
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.pink,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
