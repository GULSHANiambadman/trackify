import 'package:flutter/material.dart';

void main() {
  runApp(const MoodApp());
}

class MoodApp extends StatelessWidget {
  const MoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      home: const MoodSelectorScreen(),
    );
  }
}

class MoodSelectorScreen extends StatefulWidget {
  const MoodSelectorScreen({super.key});

  @override
  State<MoodSelectorScreen> createState() => _MoodSelectorScreenState();
}

class _MoodSelectorScreenState extends State<MoodSelectorScreen> {
  final TextEditingController _moodController = TextEditingController();
  String _suggestion = "How are you feeling today?";
  String _currentMoodEmoji = "✨";

  // Data Map: Link moods to suggestions
  final Map<String, Map<String, String>> moodData = {
    'happy': {
      'suggestion': 'Spread the joy! Call a friend or record a happy memory in a journal.',
      'emoji': '😊'
    },
    'sad': {
      'suggestion': 'It’s okay to feel this way. How about a warm cup of tea and a comforting movie?',
      'emoji': '😢'
    },
    'lonely': {
      'suggestion': 'Reach out to one person you trust, or head to a local cafe to be around people.',
      'emoji': '🫂'
    },
    'energetic': {
      'suggestion': 'Channel that energy! It’s a perfect time for a workout or starting a new project.',
      'emoji': '⚡'
    },
    'stressed': {
      'suggestion': 'Take 5 deep breaths. Try a 10-minute meditation or a quick walk outside.',
      'emoji': '🧘'
    },
    'tired': {
      'suggestion': 'Your body needs rest. Power nap for 20 minutes or dim the lights and relax.',
      'emoji': '😴'
    },
  };

  void _getSuggestion() {
    String input = _moodController.text.toLowerCase().trim();
    
    setState(() {
      if (moodData.containsKey(input)) {
        _suggestion = moodData[input]!['suggestion']!;
        _currentMoodEmoji = moodData[input]!['emoji']!;
      } else {
        _suggestion = "I don't have a specific tip for that yet, but remember to be kind to yourself!";
        _currentMoodEmoji = "🤔";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mood Guide")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _currentMoodEmoji,
              style: const TextStyle(fontSize: 80),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _moodController,
              decoration: InputDecoration(
                labelText: "Enter your mood (e.g., Happy, Sad, Stressed)",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                prefixIcon: const Icon(Icons.sentiment_satisfied_alt),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getSuggestion,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: const Text("Get Suggestion"),
            ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.indigo.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                _suggestion,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
