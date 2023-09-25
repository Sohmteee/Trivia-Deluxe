import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioProvider extends ChangeNotifier {
  final player = AudioPlayer();

  Future<void> initAudio(String audioSource) async {
    await player.setSource(AssetSource(audioSource));
  }

  Future<void> playAudio(String audioSource) async {
    await player.play(DeviceFileSource(audioSource));
  }
}
