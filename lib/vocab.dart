import 'package:flutter/material.dart';

class VocabPage extends StatelessWidget {
  const VocabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vocab'),
        backgroundColor: Colors.pink[100],
      ),
      body: Center(
        child: const Text('Content for Vocab'),
      ),
    );
  }
}