import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioProvider extends ChangeNotifier {
  final player = AudioPlayer();

  void initAudio(String audioSource) {

  }

  Future<void> playAudio (String audioSource) async {
      await player.setSource(AssetSource('sounds/coin.wav'));
  }
}
