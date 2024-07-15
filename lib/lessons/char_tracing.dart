import 'dart:math';
import 'package:flutter/material.dart';

class MatchingGame extends StatefulWidget {
  @override
  _MatchingGameState createState() => _MatchingGameState();
}

class _MatchingGameState extends State<MatchingGame> {
  List<List<String>> pinyinLevels = [
    ['gǒu', 'yáng', 'māo', 'xióng māo'],
    ['shǔ', 'niú', 'lǎo shǔ', 'lǎo yáng'],
    ['lǎo hǔ', 'lǎo lóng', 'yù mǐ', 'lǎo niú'],
  ];

  List<List<String>> imageLevels = [
    ['lib/assets/word_puzzle/dog.jpg', 'lib/assets/word_puzzle/goat.jpg', 'lib/assets/word_puzzle/cat.jpg', 'lib/assets/word_puzzle/panda.jpg'],
    ['lib/assets/word_puzzle/rat.jpg', 'lib/assets/word_puzzle/cow.jpg', 'lib/assets/word_puzzle/grandfather.jpg', 'lib/assets/word_puzzle/grandmother.jpg'],
    ['lib/assets/word_puzzle/tiger.jpg', 'lib/assets/word_puzzle/dragon.jpg', 'lib/assets/word_puzzle/corn.jpg', 'lib/assets/word_puzzle/cow.jpg'],
  ];

  int currentLevel = 0;
  List<String> currentPinyin = [];
  List<String> currentImages = [];
  String question = '';
  Map<String, String> pinyinImageMap = {};
  List<String> remainingPinyin = [];
  int score = 0;

  @override
  void initState() {
    super.initState();
    loadLevel(currentLevel);
  }

  void loadLevel(int level) {
    currentPinyin = List.from(pinyinLevels[level]);
    remainingPinyin = List.from(pinyinLevels[level]);
    currentImages = List.from(imageLevels[level]);

    shuffleImages();
    createPinyinImageMap(level);
    setQuestion();
  }

  void shuffleImages() {
    setState(() {
      currentImages.shuffle(Random());
    });
  }

  void createPinyinImageMap(int level) {
    pinyinImageMap.clear();
    for (int i = 0; i < pinyinLevels[level].length; i++) {
      pinyinImageMap[pinyinLevels[level][i]] = imageLevels[level][i];
    }
  }

  void setQuestion() {
    setState(() {
      question = remainingPinyin[Random().nextInt(remainingPinyin.length)];
    });
  }

  void checkAnswer(String pinyin, String image) {
    bool isCorrect = pinyinImageMap[pinyin] == image;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(isCorrect ? 'Good job!' : 'Wrong'),
          content: Text(isCorrect ? 'You got it right! :)' : 'You pick the wrong answer! :('),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                if (isCorrect) {
                  score++;
                }
                remainingPinyin.remove(pinyin);
                if (remainingPinyin.isEmpty) {
                  nextLevel();
                } else {
                  setQuestion();
                }
              },
            ),
          ],
        );
      },
    );
  }

  void nextLevel() {
    if (currentLevel + 1 < pinyinLevels.length) {
      setState(() {
        currentLevel++;
        loadLevel(currentLevel);
      });
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => CongratulationsPage(score: score),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('P I N Y I N   M A T C H I N G   G A M E'),
        backgroundColor: Colors.pink[100],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Match the following:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              question,
              style: const TextStyle(fontSize: 32, color: Colors.pink),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: currentImages.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      checkAnswer(question, currentImages[index]);
                    },
                    child: Card(
                      child: Image.asset(
                        currentImages[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CongratulationsPage extends StatelessWidget {
  final int score;

  CongratulationsPage({required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('C O N G R A T U L A T I O N S !'),
        backgroundColor: Colors.pink[100],
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
                'You have completed all the levels.',
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                'Your score: $score',
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => MatchingGame()),
                  );
                },
                child: const Text('Play Again'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
