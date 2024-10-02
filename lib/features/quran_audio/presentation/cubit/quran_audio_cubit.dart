import 'package:iu_mushaf/core/imports/imports.dart';
import 'package:iu_mushaf/core/widgets/custom_toast.dart';
import 'package:iu_mushaf/features/quran_audio/data/models/sur_reader_audios_model.dart';
import 'package:iu_mushaf/features/quran_audio/data/models/sur_readers_audios_model.dart';
import 'package:just_audio/just_audio.dart';

part 'quran_audio_state.dart';

class QuranAudioCubit extends Cubit<QuranAudioState> {
  QuranAudioCubit() : super(QuranAudioInitial());

  int selectedSurahNumber = 0;
  int selectedReader = 0;
  SurReaderAudiosModel? surReaderAudiosModel;
  AudioPlayer audioPlayer = sl<MediaPlayer>().audioPlayer;

  //! Select Surah and Play it
  Future selectSurah(
    context, {
    required int surahNumber,
    required SurReadersAudiosModel modelList,
  }) async {
    selectedSurahNumber = surahNumber;
    surReaderAudiosModel ??= modelList.surReadersAudios[selectedReader];
    emit(SelectSurahState());
    await playSurah(context);
    audioPlayer.playerStateStream.listen((playerState) async {
      if (playerState.processingState == ProcessingState.completed) {
        if (selectedSurahNumber != 114) {
          selectedSurahNumber++;
          await playSurah(context);
        } else {
          selectedSurahNumber = 1;
          await playSurah(context);
        }
      } else if (playerState.processingState == ProcessingState.buffering ||
          playerState.processingState == ProcessingState.loading) {
        emit(LoadingAudioState());
      } else if (playerState.processingState == ProcessingState.idle) {
        audioPlayer.pause();
        emit(AudioIdleState());
      }
    });
  }

  //! Play Audio from Assets or Links
  Future<void> playSurah(context) async {
    String url = surReaderAudiosModel!.surUrls[selectedSurahNumber - 1].url;

    if (url.startsWith("http://") || url.startsWith("https://")) {
      try {
        await audioPlayer.setUrl(url);
        audioPlayer.play();
      } catch (e) {
        showToast(context, "No Network");
      }
    } else {
      await audioPlayer.setAsset(url);
      audioPlayer.play();
    }
    emit(SelectSurahState());
  }

  //! Audio Seek
  Future audioPlayerSeek(value) async {
    await audioPlayer.seek(Duration(seconds: value.toInt()));
    emit(AudioPlayerSeekState());
  }

  //! Skip Forward
  Future audioPlayerSkipFroward(context, modelList) async {
    selectSurah(
      context,
      surahNumber: selectedSurahNumber + 1,
      modelList: modelList,
    );
  }

  //! Skip Backward
  Future audioPlayerSkipBackward(context, modelList) async {
    selectSurah(
      context,
      surahNumber: selectedSurahNumber - 1,
      modelList: modelList,
    );
  }

  //! Play & Pause Toggle
  Future<void> playAndPauseToggle() async {
    audioPlayer.playing ? audioPlayer.pause() : audioPlayer.play();
    emit(SelectSurahState());
  }
}
