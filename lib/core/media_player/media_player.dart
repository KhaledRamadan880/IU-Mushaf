import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

class MediaPlayer {
  final listenToAyahPlayer = AudioPlayer();
  final audioPlayer = AudioPlayer();

  Future inital() async {
    await JustAudioBackground.init(
      androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
      androidNotificationChannelName: 'Audio playback',
      androidNotificationOngoing: true,
    );
  }
}
