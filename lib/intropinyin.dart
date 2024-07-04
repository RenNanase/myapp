import 'package:flutter/material.dart';

class IntroPinyinTonesPage extends StatelessWidget {
  const IntroPinyinTonesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Intro Pinyin Tones'),
        backgroundColor: Colors.pink[100],
      ),
      body: Center(
        child: const Text('Content for Intro Pinyin Tones'),
      ),
    );
  }
}