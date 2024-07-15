import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentIndex = 0;
  int _score = 0;
  bool _showScore = false; // Flag to show score after quiz completion

  List<Map<String, dynamic>> _questions = [
    {
      'question': 'nǐ hǎo',
      'options': ['Hello! What is your name?', 'Hello', 'Where are you from?'],
      'correctIndex': 1,
    },
    {
      'question': 'tā míng jiào',
      'options': ['His name is..', 'Where is the nearest restaurant?', 'How much does it cost?'],
      'correctIndex': 0,
    },
    {
      'question': 'wǒ hěn hǎo',
      'options': ['Are you free tomorrow? Let\'s go watch a movie together!', 'What time is it now?', 'I am fine'],
      'correctIndex': 2,
    },
    {
      'question': 'nǐ chīfàn le ma',
      'options': ['Have you eaten?', 'What are you doing?', 'Where do you live?'],
      'correctIndex': 0,
    },
    {
      'question': 'wǒ bù dǒng',
      'options': ['I don\'t know', 'What did you say?', 'How old are you?'],
      'correctIndex': 0,
    },
    {
      'question': 'duìbuqǐ',
      'options': ['Excuse me', 'Thank you', 'Please'],
      'correctIndex': 0,
    },
    {
      'question': 'wǒ jiào',
      'options': ['My name is..', 'What\'s your name?', 'How are you?'],
      'correctIndex': 0,
    },
    {
      'question': 'nǐ shuō shénme',
      'options': ['What\'s your name?', 'What did you say?', 'Where do you live?'],
      'correctIndex': 1,
    },
    {
      'question': 'nǐ huì shuō yīngwén ma',
      'options': ['Do you speak English?', 'Are you from China?', 'What\'s your name?'],
      'correctIndex': 0,
    },
    {
      'question': 'wǒ zài xuéxí zhōngwén',
      'options': ['I am learning Chinese', 'What are you doing?', 'Where are you going?'],
      'correctIndex': 0,
    },
  ];

  int? _selectedOptionIndex;

  void _checkAnswer() {
    if (_selectedOptionIndex != null) {
      if (_selectedOptionIndex == _questions[_currentIndex]['correctIndex']) {
        setState(() {
          _score++;
        });
      }
      if (_currentIndex < _questions.length - 1) {
        _showNextQuestion();
      } else {
        setState(() {
          _showScore = true;
        });
      }
    }
  }

  void _showNextQuestion() {
    setState(() {
      _selectedOptionIndex = null;
      _currentIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('M A N D A R I N  Q U I Z'),
        backgroundColor: Colors.pink[100], // Set app bar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LinearProgressIndicator(
              value: (_currentIndex + 1) / _questions.length,
              minHeight: 10,
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.pinkAccent),
            ),
            const SizedBox(height: 10.0),
            Text(
              'Question ${_currentIndex + 1}/${_questions.length}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            _showScore ? _buildScoreCard() : _buildQuestionCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildScoreCard() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Quiz Completed!',
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20.0),
        Text(
          'Your Score: $_score/${_questions.length}',
          style: const TextStyle(fontSize: 20.0),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildQuestionCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          _questions[_currentIndex]['question'],
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 24.0),
        ),
        const SizedBox(height: 20.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: List.generate(
            _questions[_currentIndex]['options'].length,
                (index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _selectedOptionIndex = index;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _selectedOptionIndex == index ? Colors.pink[200] : Colors.cyan,
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                ),
                child: Text(
                  _questions[_currentIndex]['options'][index],
                  style: const TextStyle(fontSize: 18.0),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 30.0),
        ElevatedButton(
          onPressed: _selectedOptionIndex != null ? _checkAnswer : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.yellow,
          ),
          child: Text(
            _currentIndex < _questions.length - 1 ? 'Next Question' : 'Finish Quiz',
          ),
        )
      ],
    );
  }
}
