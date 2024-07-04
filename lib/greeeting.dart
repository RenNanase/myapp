import 'package:flutter/material.dart';

class GreetingsCommonPhrasesPage extends StatelessWidget {
  const GreetingsCommonPhrasesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Greetings & Common Phrases'),
        backgroundColor: Colors.pink[100],
      ),
      body: Center(
        child: const Text('Content for Greetings & Common Phrases'),
      ),
    );
  }
}