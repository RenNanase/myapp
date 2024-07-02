import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  void onAlphabetTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AlphabetPage()),
    );
  }

  void onHelloChinaTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HelloChinaPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HeyChina"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                "Unlock Lessons & HSK Tests\nDiscount 60% For New User",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () => onAlphabetTap(context),
                child: Row(
                  children: [
                    Image.asset('lib/assets/alphabet_icon.png', width: 50),
                    SizedBox(width: 10),
                    Text(
                      "The alphabet",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () => onHelloChinaTap(context),
                child: Row(
                  children: [
                    Image.asset('lib/assets/hello_china_icon.png', width: 50),
                    SizedBox(width: 10),
                    Text(
                      "Hello China!",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Image.asset('lib/assets/who_am_i_icon.png', width: 50),
                  SizedBox(width: 10),
                  Text(
                    "Who I am?",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: Icon(Icons.home, color: Colors.white),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.person, color: Colors.white),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.chat, color: Colors.white),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.timer, color: Colors.white),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.diamond, color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AlphabetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The Alphabet'),
      ),
      body: Center(
        child: Text('Content for The Alphabet'),
      ),
    );
  }
}

class HelloChinaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello China!'),
      ),
      body: Center(
        child: Text('Content for Hello China!'),
      ),
    );
  }
}
