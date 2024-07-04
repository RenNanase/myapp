import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(Fooddrink());
}

class Fooddrink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mandarin Mastery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFF1E1E1E),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
        ),
      ),
      home: FoodScreen(),
    );
  }
}

class FoodScreen extends StatefulWidget {
  @override
  _FoodScreenState createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  int currentQuestionIndex = 0;
  final player = AudioPlayer();

  final List<Map<String, dynamic>> questions = [
    {
      'questionText': 'mǐfàn',
      'questionTextChinese': '米饭',
      'audioFile': 'assets/sounds/mifan.mp3',
      'options': [
        {'label': 'water', 'image': 'lib/assets/water.png', 'isCorrect': false},
        {'label': 'rice', 'image': 'lib/assets/rice.png', 'isCorrect': true},
        {'label': 'tea', 'image': 'lib/assets/tea.png', 'isCorrect': false},
        {'label': 'soup', 'image': 'lib/assets/soup.png', 'isCorrect': false},
      ]
    },
    {
      'questionText': 'chá',
      'questionTextChinese': '茶',
      'audioFile': 'assets/sounds/cha.mp3',
      'options': [
        {'label': 'water', 'image': 'lib/assets/water.png', 'isCorrect': false},
        {'label': 'rice', 'image': 'lib/assets/rice.png', 'isCorrect': false},
        {'label': 'tea', 'image': 'lib/assets/tea.png', 'isCorrect': true},
        {'label': 'soup', 'image': 'lib/assets/soup.png', 'isCorrect': false},
      ]
    },
    {
      'questionText': 'shuǐ',
      'questionTextChinese': '水',
      'audioFile': 'assets/sounds/shui.mp3',
      'options': [
        {'label': 'water', 'image': 'lib/assets/water.png', 'isCorrect': true},
        {'label': 'rice', 'image': 'lib/assets/rice.png', 'isCorrect': false},
        {'label': 'tea', 'image': 'lib/assets/tea.png', 'isCorrect': false},
        {'label': 'soup', 'image': 'lib/assets/soup.png', 'isCorrect': false},
      ]
    },
    {
      'questionText': 'tāng',
      'questionTextChinese': '汤',
      'audioFile': 'assets/sounds/tang.mp3',
      'options': [
        {'label': 'water', 'image': 'lib/assets/water.png', 'isCorrect': false},
        {'label': 'rice', 'image': 'lib/assets/rice.png', 'isCorrect': false},
        {'label': 'tea', 'image': 'lib/assets/tea.png', 'isCorrect': false},
        {'label': 'soup', 'image': 'lib/assets/soup.png', 'isCorrect': true},
      ]
    },
    {
      'questionText': 'niúnǎi',
      'questionTextChinese': '牛奶',
      'audioFile': 'assets/sounds/niunai.mp3',
      'options': [
        {'label': 'water', 'image': 'lib/assets/water.png', 'isCorrect': false},
        {'label': 'rice', 'image': 'lib/assets/rice.png', 'isCorrect': false},
        {'label': 'tea', 'image': 'lib/assets/tea.png', 'isCorrect': false},
        {'label': 'milk', 'image': 'lib/assets/milk.png', 'isCorrect': true},
      ]
    }
  ];

  void checkAnswer(bool isCorrect) {
    if (isCorrect) {
      if (currentQuestionIndex < questions.length - 1) {
        setState(() {
          currentQuestionIndex++;
        });
      } else {
        // Optionally handle the completion of all questions
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('You have completed all questions!')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('You got the wrong answer')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E1E),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select the correct image',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(
                  currentQuestion['questionText'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: Icon(Icons.volume_up, color: Colors.white),
                  onPressed: () {
                    player.play(AssetSource(currentQuestion['audioFile']));
                  },
                ),
              ],
            ),
            Text(
              currentQuestion['questionTextChinese'],
              style: TextStyle(
                color: Colors.purple,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: currentQuestion['options']
                    .map<Widget>((option) => GestureDetector(
                          onTap: () => checkAnswer(option['isCorrect']),
                          child: FoodOption(
                            image: option['image'],
                            label: option['label'],
                          ),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FoodOption extends StatelessWidget {
  final String image;
  final String label;

  const FoodOption({
    Key? key,
    required this.image,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF2E2E2E),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                image,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
