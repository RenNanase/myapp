import 'package:flutter/material.dart';

class Infographic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('I N F O G R A P H I C'),
        backgroundColor: Colors.pink[100],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('lib/assets/hoc.jpg'),
              Image.asset('lib/assets/cc.jpg'),
            ],
          ),
        ),
      ),
    );
  }
}
