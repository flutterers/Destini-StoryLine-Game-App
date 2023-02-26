import 'package:destini/story_brain.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Destini());
}

StoryBrain storyBrain = StoryBrain();

class Destini extends StatelessWidget {
  const Destini({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Destini',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: const Center(
            child: Text(
              "Destini",
              style: TextStyle(
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                  fontFamily: "Pacifico",
                  color: Colors.white70),
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("images/my_bg2.jpg"),
              // image: AssetImage("images/background.png"),
            ),
          ),
          constraints: const BoxConstraints.expand(),
          padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
          child: const SafeArea(
            child: StoryPage(),
          ),
        ),
      ),
    );
  }
}

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  String story = storyBrain.getStory();

  void updateStory(int choiceNumber) {
    setState(() {
      storyBrain.nextStory(choiceNumber);
      story = storyBrain.getStory();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              story,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.normal,
                fontFamily: "Source Sans Pro",
                color: Colors.white70,
                backgroundColor: Colors.black87,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.black87,
            ),
            onPressed: () {
              updateStory(1);
            },
            child: Text(
              storyBrain.getChoice1(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontFamily: "Source Sans Pro",
                fontWeight: FontWeight.bold,
                color: Colors.yellow.shade700,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Visibility(
          visible: storyBrain.buttonShouldBeVisible(),
          child: Expanded(
            flex: 1,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.black87,
              ),
              onPressed: () {
                updateStory(2);
              },
              child: Text(
                storyBrain.getChoice2(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Source Sans Pro",
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow.shade900,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
