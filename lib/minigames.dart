import 'package:flutter/material.dart';
import 'package:myapp/lessons/char_tracing.dart'; // Replace with actual import path
import 'package:myapp/lessons/world_puzzle.dart'; // Replace with actual import path

class MiniGames extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('M I N I  G A M E S'),
        backgroundColor: Colors.pink[100], // Pink app bar background
      ),
      body: Container(
        color: Colors.pink[50], // Set the background color to pink[50]
        child: GridView.count(
          crossAxisCount: 2, // Number of columns in the grid
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
          padding: const EdgeInsets.all(20.0),
          children: [
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MatchingGame()),
                  );
                },
                borderRadius: BorderRadius.circular(20),
                child: Ink(
                  decoration: BoxDecoration(
                    color: Colors.cyan, // Pink box background
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Center(
                      child: Text(
                        'Pinyin Matching Games',
                        style: TextStyle(fontSize: 24, color: Colors.white), // Text color
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WordPuzzleGame()),
                  );
                },
                borderRadius: BorderRadius.circular(20),
                child: Ink(
                  decoration: BoxDecoration(
                    color: Colors.pinkAccent, // Pink box background
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Center(
                      child: Text(
                        'Word Puzzle Game',
                        style: TextStyle(fontSize: 24, color: Colors.white), // Text color
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Add more Material-InkWell widgets for additional games as needed
          ],
        ),
      ),
    );
  }
}
