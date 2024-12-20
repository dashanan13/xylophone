import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const Xylophone());
}

class Xylophone extends StatelessWidget {
  const Xylophone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //disabled debug banner
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Xylophone',
            style: TextStyle(
              color: Colors.white,          // White color for contrast
              fontSize: 24,                 // Larger font size
              fontWeight: FontWeight.bold,  // Bold text
              letterSpacing: 1.5,          // Spacing between letters
              shadows: [Shadow(color: Colors.black,offset: Offset(2, 2),blurRadius: 3,),],
            ),
          ),
          backgroundColor: Colors.black,
          centerTitle: true,
          elevation: 8,  // Adds shadow under the AppBar
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // Make children stretch full width
            children: [
              buildplayButton(Colors.red, 'note1.wav'),
              buildplayButton(Colors.orange, 'note2.wav'),
              buildplayButton(Colors.yellow, 'note3.wav'),
              buildplayButton(Colors.green, 'note4.wav'),
              buildplayButton(Colors.teal, 'note5.wav'), // Teal color
              buildplayButton(Colors.blue, 'note6.wav'),
              buildplayButton(Colors.purple, 'note7.wav'),
            ],
          ),
        ),
      ),
    );
  }

  Expanded buildplayButton(Color colorvalue, String audioname) {
    return Expanded(
      child: Container(
        color: colorvalue,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () async {
              final player = AudioPlayer();
              await player.play(AssetSource(audioname));
            },
            child: const SizedBox.expand(),
          ),
        ),
      ),
    );
  }
}