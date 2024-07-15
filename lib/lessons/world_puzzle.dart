import 'package:flutter/material.dart';

class WordPuzzleGame extends StatefulWidget {
  @override
  _WordPuzzleGameState createState() => _WordPuzzleGameState();
}

class _WordPuzzleGameState extends State<WordPuzzleGame> {
  late String _currentCharacter;
  late String _englishMeaning;
  TextEditingController _controller = TextEditingController();

  // Define Chinese characters and their English meanings
  List<Map<String, String>> _wordPairs = [
    {'character': 'mā ma', 'meaning': 'mother', 'image': 'lib/assets/word_puzzle/mother.jpg'},
    {'character': 'māo', 'meaning': 'cat', 'image': 'lib/assets/word_puzzle/cat.jpg'},
    {'character': 'hóng', 'meaning': 'red', 'image': 'lib/assets/word_puzzle/red.jpg'},
    {'character': 'bā', 'meaning': 'eight', 'image': 'lib/assets/word_puzzle/eight.jpg'},
    {'character': 'píng guǒ', 'meaning': 'apple', 'image': 'lib/assets/word_puzzle/apple.jpg'},
    {'character': 'èr', 'meaning': 'two', 'image': 'lib/assets/word_puzzle/two.jpg'},
    {'character': 'yù mǐ', 'meaning': 'corn', 'image': 'lib/assets/word_puzzle/corn.jpg'},
    {'character': 'xī guā', 'meaning': 'watermelon', 'image': 'lib/assets/word_puzzle/watermelon.jpg'},
    {'character': 'wǔ', 'meaning': 'five', 'image': 'lib/assets/word_puzzle/five.jpg'},
    {'character': 'huáng sè', 'meaning': 'yellow', 'image': 'lib/assets/word_puzzle/yellow.jpg'},
    {'character': 'gǒu', 'meaning': 'dog', 'image': 'lib/assets/word_puzzle/dog.jpg'},
    {'character': 'yáng', 'meaning': 'goat', 'image': 'lib/assets/word_puzzle/goat.jpg'},
    {'character': 'xióng māo', 'meaning': 'panda', 'image': 'lib/assets/word_puzzle/panda.jpg'},
    {'character': 'nán guā', 'meaning': 'pumpkin', 'image': 'lib/assets/word_puzzle/pumpkin.jpg'},
    {'character': 'zǐ sè', 'meaning': 'purple', 'image': 'lib/assets/word_puzzle/purple.jpg'},
    // Add more as needed
  ];

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _generateNewWord();
  }

  void _generateNewWord() {
    // Select a word pair based on current index
    Map<String, String> wordPair = _wordPairs[_currentIndex];
    _currentCharacter = wordPair['character']!;
    _englishMeaning = wordPair['meaning']!;
  }

  void _checkAnswer(String input) {
    // Trim leading and trailing whitespace from input
    String trimmedInput = input.trim();

    if (trimmedInput.toLowerCase() == _englishMeaning.toLowerCase()) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.pink[50], // Set background color to pink[50]
            title: const Text('Correct!', style: TextStyle(color: Colors.black)),
            content: const Text('You solved the word puzzle.', style: TextStyle(color: Colors.black)),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _controller.clear();
                  _navigateToNextQuestion();
                },
                child: const Text('Next'),
              ),
            ],
          );
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.pink[50], // Set background color to pink[50]
          content: const Text('Try again.', style: TextStyle(color: Colors.black)),
        ),
      );
    }
  }

  void _navigateToNextQuestion() {
    setState(() {
      if (_currentIndex < _wordPairs.length - 1) {
        _currentIndex++;
        _generateNewWord();
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => CongratulationsPage(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('W O R D  P U Z Z L E'),
        backgroundColor: Colors.pink[100], // Set app bar color to pink[100]
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(30.0), // Increased padding for larger box
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  if (_wordPairs[_currentIndex]['image'] != null)
                    Image.asset(
                      _wordPairs[_currentIndex]['image']!,
                      height: 300.0, // Adjusted height of the image
                    ),
                  const SizedBox(height: 20.0),
                  Text(
                    _currentCharacter, // Display original character here
                    style: const TextStyle(fontSize: 80.0), // Increased font size
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Type your guess (in English)',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.check),
                    onPressed: () => _checkAnswer(_controller.text),
                  ),
                ),
                textAlign: TextAlign.center,
                onSubmitted: _checkAnswer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CongratulationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('C O N G R A T U L A T I O N S !'),
        backgroundColor: Colors.pink[100], // Set app bar color to pink[100]
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Congratulations!',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.pink),
              ),
              const SizedBox(height: 20),
              const Text(
                'You have completed all the questions.',
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => WordPuzzleGame()),
                  );
                },
                child: const Text('Play Again'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
