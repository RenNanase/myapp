import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:myapp/homepage.dart';

class VocabularyApp extends StatelessWidget {
  final Map<String, List<Map<String, String>>> vocabularyData = {
    'G R E E T I N G': [
      {'English': 'Hello', 'Chinese': 'nǐhǎo', 'Sound': 'greeting/nihau.mp3'},
      {'English': 'Hi, Everyone', 'Chinese': 'dàjiāhǎo', 'Sound': 'greeting/taciahau.mp3'},
      {'English': 'Have you eaten?', 'Chinese': 'nǐ chīfàn le ma', 'Sound': 'greeting/nice fanlema.mp3'},
      {'English': 'I am fine', 'Chinese': 'wǒ hěn hǎo', 'Sound': 'greeting/wo enhau.mp3'},
      {'English': 'Sorry, do you speak English?', 'Chinese': 'duìbuqǐ, nǐ huì shuō yīngwén ma', 'Sound': 'greeting/tui puci ni she eng weme.mp3'},
      {'English': 'My name is..', 'Chinese': 'wǒ jiào', 'Sound': 'greeting/wo ziau.mp3'},
      {'English': 'What is your name?', 'Chinese': 'nǐ jiào shénme míngzi', 'Sound': 'greeting/ni ziau sheme mingze.mp3'},
      {'English': 'What is your phone number?', 'Chinese': 'nǐde diànhuà hàomǎ shì duōshǎo', 'Sound': 'greeting/what is your phone number.mp3'},
      {'English': 'How old are you?', 'Chinese': 'nǐ duōshǎo suì', 'Sound': 'greeting/ni tuo suai sui.mp3'},
      {'English': 'I am 25 years old', 'Chinese': 'wǒ èrshíwǔ suì', 'Sound': 'greeting/wo er se usui.mp3'},
    ],
    'C O U R T E S Y': [
      {'English': 'Sorry', 'Chinese': 'duìbùqǐ', 'Sound': 'courtesy/tui pu xi.mp3'},
      {'English': 'Thank you', 'Chinese': 'xiè xie nǐ', 'Sound': 'courtesy/xexe ni.mp3'},
      {'English': 'Many thanks', 'Chinese': 'duō xiè', 'Sound': 'courtesy/tuose.mp3'},
      {'English': 'No thank you', 'Chinese': 'búyào xièxie', 'Sound': 'courtesy/puyau sheshe.mp3'},
      {'English': 'Nevermind', 'Chinese': 'méi guānxi', 'Sound': 'courtesy/meihuansi.mp3'},
      {'English': 'It doesnt matter', 'Chinese': 'méi shì', 'Sound': 'courtesy/meishe.mp3'},
      {'English': 'Goodbye', 'Chinese': 'zài jiàn', 'Sound': 'courtesy/jaizien.mp3'},
      {'English': 'All the best', 'Chinese': 'jiā yóu', 'Sound': 'courtesy/jiayou.mp3'},
      {'English': 'I got to go', 'Chinese': 'wǒ děi zǒu le', 'Sound': 'courtesy/wode cau le.mp3'},
      {'English': 'See you soon', 'Chinese': 'yíhuìr jiàn', 'Sound': 'courtesy/ehuisen.mp3'},
      {'English': 'Take care', 'Chinese': 'màn zǒu', 'Sound': 'courtesy/mansou.mp3'},
      {'English': 'Stay in touch!', 'Chinese': 'bǎochí liánxì', 'Sound': 'courtesy/pase lansi.mp3'},
    ],
    'A T  R E S T A U R A N T': [
      {'English': 'waiter', 'Chinese': 'fúwù yuán', 'Sound': 'at restaurant/pu yen.mp3'},
      {'English': 'One more please', 'Chinese': 'zài lái yī gè', 'Sound': 'at restaurant/zai le ike.mp3'},
      {'English': 'is there a cafe nearby', 'Chinese': 'fùjìn yǒu kāfēi tīng ma', 'Sound': 'at restaurant/huo cha ye keting ma.mp3'},
      {'English': 'Are you hungry?', 'Chinese': ' nǐ è le ma', 'Sound': 'at restaurant/ni e lema.mp3'},
      {'English': 'Are you thirsty?', 'Chinese': 'nǐ kě le ma', 'Sound': 'at restaurant/ni ke lema.mp3'},
      {'English': 'What would you like to eat?', 'Chinese': 'nǐ xiǎng chī shénme', 'Sound': 'at restaurant/ni xiang seh sehme.mp3'},
      {'English': 'I am full', 'Chinese': 'wǒ bǎo le', 'Sound': 'at restaurant/wo pau le.mp3'},
      {'English': 'I would like to drink coffee', 'Chinese': 'wǒ xiǎng hē kāfēi', 'Sound': 'at restaurant/huo chang er kafe.mp3'},
      {'English': 'Im hungry', 'Chinese': 'wǒ è le', 'Sound': 'at restaurant/wo e leng.mp3'},
      {'English': 'I want to reserve a table', 'Chinese': 'wǒ yào dìng yì zhuō', 'Sound': 'at restaurant/woyau ting etuo.mp3'},
    ],
    'S U R V I V A L': [
      {'English': 'I cant speak Chinese', 'Chinese': 'wǒ búhuì shuō zhōngwén', 'Sound': 'survival/i cant speak chinese.mp3'},
      {'English': 'I dont understand what youre saying', 'Chinese': 'wǒ tīng bù dǒng nǐde huà', 'Sound': 'survival/i dont understand what youre saying.mp3'},
      {'English': 'I cant read it', 'Chinese': 'wǒ kàn bù dǒng', 'Sound': 'survival/i cant read it.mp3'},
      {'English': 'I dont understand', 'Chinese': 'wǒ bù dǒng', 'Sound': 'survival/i dont understand.mp3'},
      {'English': 'please write it here', 'Chinese': 'qǐng xiě zài zhèlǐ', 'Sound': 'survival/please write it here.mp3'},
      {'English': 'What did you say?', 'Chinese': 'nǐ shuō shénme', 'Sound': 'survival/what did you say.mp3'},
      {'English': 'Do you speak English?', 'Chinese': 'nǐ huì shuō yīngyǔ ma', 'Sound': 'survival/do you speak english.mp3'},
      {'English': 'I dont understand what you mean', 'Chinese': 'wǒ bù dǒng nǐde yìsi', 'Sound': 'survival/i dont what you mean.mp3'},
      {'English': 'Could you speak more slowly', 'Chinese': 'qǐng shuō màn diǎn', 'Sound': 'survival/could you speak more slowly.mp3'},
    ],
    'M I S C E L L A N E O U S': [
      {'English': 'why', 'Chinese': 'wèishénme', 'Sound': 'misc/wai sheme.mp3'},
      {'English': 'what', 'Chinese': 'shén me', 'Sound': 'misc/sheme.mp3'},
      {'English': 'correct', 'Chinese': 'dui', 'Sound': 'misc/tui.mp3'},
      {'English': 'what is this?', 'Chinese': 'zhè shì shénme', 'Sound': 'misc/ce shi sheme.mp3'},
      {'English': 'I would like (to)', 'Chinese': 'wǒxiǎngyào', 'Sound': 'misc/wo xiang yau.mp3'},
      {'English': 'How much?', 'Chinese': 'duōshǎo', 'Sound': 'misc/tuo sau.mp3'},
      {'English': 'I dont know', 'Chinese': 'wǒ bù zhīdào', 'Sound': 'misc/wo pu cetau.mp3'},
      {'English': 'OK', 'Chinese': 'hǎode', 'Sound': 'misc/how de.mp3'},
      {'English': 'How do you know?', 'Chinese': 'nǐ zěnme zhīdào', 'Sound': 'misc/ni tzeme cetau.mp3'},
      {'English': 'Do you have..?', 'Chinese': 'nǐ yǒuméiyǒu ...', 'Sound': 'misc/ni you meyou.mp3'},
    ],
  };

  VocabularyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vocabulary App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: Colors.pink[50],
      ),
      home: HomeScreen(vocabularyData: vocabularyData),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final Map<String, List<Map<String, String>>> vocabularyData;

  const HomeScreen({Key? key, required this.vocabularyData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('E X P R E S S I O N S  L I S T'),
        backgroundColor: Colors.pink[100], // Lighter shade of pink
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(  // Navigate to HomePage and replace current route
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          },
        ),
      ),
      body: ListView.builder(
        itemCount: vocabularyData.keys.length,
        itemBuilder: (context, index) {
          String category = vocabularyData.keys.elementAt(index);
          return Card(
            child: ListTile(
              title: Text(category),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.pink[300],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VocabularyListScreen(
                      category: category,
                      words: vocabularyData[category]!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class VocabularyListScreen extends StatefulWidget {
  final String category;
  final List<Map<String, String>> words;

  const VocabularyListScreen({
    super.key,
    required this.category,
    required this.words,
  });

  @override
  State<VocabularyListScreen> createState() => _VocabularyListScreenState();
}

class _VocabularyListScreenState extends State<VocabularyListScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> _playAudio(String audioUrl) async {
    try {
      final ref = FirebaseStorage.instance.ref().child(audioUrl);
      final url = await ref.getDownloadURL();
      await _audioPlayer.play(UrlSource(url));
    } catch (e) {
      print('Error playing audio: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.category),
        backgroundColor: Colors.pink[100], // Lighter shade of pink
      ),
      body: ListView.builder(
        itemCount: widget.words.length,
        itemBuilder: (context, index) {
          var word = widget.words[index];
          return Padding(
            padding: const EdgeInsets.all(3.0),
            child: Card(
              child: ListTile(
                title: Text(
                  word['English']!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  word['Chinese']!,
                  style: const TextStyle(color: Colors.black87),
                ),
                trailing: IconButton(
                  icon:  Icon(Icons.volume_up, color: Colors.pink[300]),

                  onPressed: () => _playAudio(word['Sound']!),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
