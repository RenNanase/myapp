import 'package:flutter/material.dart';

class VocabularyPage extends StatefulWidget {
  const VocabularyPage({super.key});

  @override
  State<VocabularyPage> createState() => _VocabularyPageState();
}

class _VocabularyPageState extends State<VocabularyPage> {
  final List<String> vocabularyTypes = [
    'A N I M A L S',
    'F R U I T S',
    'C O L O R S',
    'N U M B E R S',
    'F A M I L Y  M E M B E R S',
    // Add more vocabulary types as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('V O C A B U L A R Y'),
        backgroundColor: Colors.pink[100],
      ),
      body: Container(
        color: Colors.pink[50], // Set background color to pink[50]
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: vocabularyTypes.length,
            itemBuilder: (context, index) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 0, // Removed shadow
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  title: Text(
                    vocabularyTypes[index],
                    style: const TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 18,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.pink[300],
                  ),
                  onTap: () {
                    // Navigate to the specific vocabulary type page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VocabularyListPage(vocabularyType: vocabularyTypes[index]),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class VocabularyListPage extends StatelessWidget {
  final String vocabularyType;

  const VocabularyListPage({super.key, required this.vocabularyType});

  @override
  Widget build(BuildContext context) {
    final Map<String, List<Map<String, String>>> vocabularyData = {
      'A N I M A L S': [
        {'English': 'Cat', 'Chinese': 'māo', 'Image': 'lib/assets/word_puzzle/cat.jpg'},
        {'English': 'Dog', 'Chinese': 'gǒu', 'Image': 'lib/assets/word_puzzle/dog.jpg'},
        {'English': 'Cow', 'Chinese': 'niú', 'Image': 'lib/assets/word_puzzle/cow.jpg'},
        {'English': 'Rat', 'Chinese': 'shǔ', 'Image': 'lib/assets/word_puzzle/rat.jpg'},
        {'English': 'Goat', 'Chinese': 'yáng', 'Image': 'lib/assets/word_puzzle/goat.jpg'},
        {'English': 'Dragon', 'Chinese': 'lóng', 'Image': 'lib/assets/word_puzzle/dragon.jpg'},
        {'English': 'panda', 'Chinese': 'xióng māo', 'Image': 'lib/assets/word_puzzle/panda.jpg'},
        {'English': 'Rabbit', 'Chinese': 'tù zi', 'Image': 'lib/assets/word_puzzle/rabbit.jpg'},
        // Add more animals
      ],
      'F R U I T S': [
        {'English': 'Apple', 'Chinese': 'píng guǒ', 'Image': 'lib/assets/word_puzzle/apple.jpg'},
        {'English': 'Banana', 'Chinese': 'xiāng jiāo', 'Image': 'lib/assets/word_puzzle/banana.jpg'},
        {'English': 'Watermelon', 'Chinese': 'xī guā', 'Image': 'lib/assets/word_puzzle/watermelon.jpg'},
        {'English': 'Avocado', 'Chinese': 'niú yóu guǒ', 'Image': 'lib/assets/word_puzzle/avocado.jpg'},
        {'English': 'Cherry', 'Chinese': 'yīng táo', 'Image': 'lib/assets/word_puzzle/cherry.jpg'},
        {'English': 'Mangosteen', 'Chinese': 'shān zhú', 'Image': 'lib/assets/word_puzzle/mangosteen.jpg'},
        {'English': 'Pear', 'Chinese': 'lí', 'Image': 'lib/assets/word_puzzle/pear.jpg'},
        {'English': 'Mango', 'Chinese': 'máng guǒ', 'Image': 'lib/assets/word_puzzle/mango.jpg'},
        // Add more fruits
      ],
      'C O L O R S': [
        {'English': 'Red', 'Chinese': 'hóng sè', 'Image': 'lib/assets/word_puzzle/red.jpg'},
        {'English': 'Blue', 'Chinese': 'lán sè', 'Image': 'lib/assets/word_puzzle/blue.jpg'},
        {'English': 'Yellow', 'Chinese': 'huáng sè', 'Image': 'lib/assets/word_puzzle/yellow.jpg'},
        {'English': 'Purple', 'Chinese': 'zǐ sè', 'Image': 'lib/assets/word_puzzle/purple.jpg'},
        {'English': 'Pink', 'Chinese': 'fěn hóng sè', 'Image': 'lib/assets/word_puzzle/pink.jpg'},
        {'English': 'Black', 'Chinese': 'hēi sè', 'Image': 'lib/assets/word_puzzle/black.jpg'},
        {'English': 'White', 'Chinese': 'bái sè', 'Image': 'lib/assets/word_puzzle/white.jpg'},
        {'English': 'Brown', 'Chinese': 'zōng sè', 'Image': 'lib/assets/word_puzzle/brown.jpg'},
        // Add more colors
      ],
      'N U M B E R S': [
        {'English': 'One', 'Chinese': 'yī', 'Image': 'lib/assets/word_puzzle/one.jpg'},
        {'English': 'Two', 'Chinese': 'èr', 'Image': 'lib/assets/word_puzzle/two.jpg'},
        {'English': 'Three', 'Chinese': 'sān', 'Image': 'lib/assets/word_puzzle/three.jpg'},
        {'English': 'Four', 'Chinese': 'sì', 'Image': 'lib/assets/word_puzzle/four.jpg'},
        {'English': 'Five', 'Chinese': 'wǔ', 'Image': 'lib/assets/word_puzzle/five.jpg'},
        {'English': 'Six', 'Chinese': 'liù', 'Image': 'lib/assets/word_puzzle/six.jpg'},
        {'English': 'Seven', 'Chinese': 'qī', 'Image': 'lib/assets/word_puzzle/seven.jpg'},
        {'English': 'Eight', 'Chinese': 'bā', 'Image': 'lib/assets/word_puzzle/eight.jpg'},
        {'English': 'Nine', 'Chinese': 'jiǔ', 'Image': 'lib/assets/word_puzzle/nine.jpg'},
        {'English': 'Ten', 'Chinese': 'shí', 'Image': 'lib/assets/word_puzzle/ten.jpg'},
        // Add more numbers
      ],
      'F A M I L Y  M E M B E R S': [
        {'English': 'Mother', 'Chinese': 'mā ma', 'Image': 'lib/assets/word_puzzle/mother.jpg'},
        {'English': 'Father', 'Chinese': 'bà ba', 'Image': 'lib/assets/word_puzzle/father.jpg'},
        {'English': 'Grandmother', 'Chinese': 'nǎi nai', 'Image': 'lib/assets/word_puzzle/grandmother.jpg'},
        {'English': 'Grandfather', 'Chinese': 'yé ye', 'Image': 'lib/assets/word_puzzle/grandfather.jpg'},
        {'English': 'Sister', 'Chinese': 'jiějiě', 'Image': 'lib/assets/word_puzzle/sister.jpg'},
        {'English': 'Brother', 'Chinese': 'gēgē', 'Image': 'lib/assets/word_puzzle/brother.jpg'},
        {'English': 'Little Sister', 'Chinese': 'dìdi ', 'Image': 'lib/assets/word_puzzle/little sister.jpg'},
        {'English': 'Little Brother', 'Chinese': 'mèimei', 'Image': 'lib/assets/word_puzzle/little brother.jpg'},
        // Add more family members
      ],
      // Add more types as needed
    };

    final List<Map<String, String>>? vocabularyItems = vocabularyData[vocabularyType];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          vocabularyType,
          style: const TextStyle(
            fontFamily: 'Arial',
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.pink[100],
      ),
      body: Container(
        color: Colors.pink[50],
        child: vocabularyItems == null
            ? const Center(child: Text('No items found'))
            : GridView.builder(
          padding: const EdgeInsets.all(16.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 2 / 2.5, // Adjust the aspect ratio as needed
          ),
          itemCount: vocabularyItems.length,
          itemBuilder: (context, index) {
            final item = vocabularyItems[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (item['Image'] != null)
                      Image.asset(
                        item['Image']!,
                        height: 300.0, // Adjust the image height as needed
                      ),
                    const SizedBox(height: 16.0),
                    Text(
                      item['English'] ?? '',
                      style: const TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      item['Chinese'] ?? '',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 18,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
