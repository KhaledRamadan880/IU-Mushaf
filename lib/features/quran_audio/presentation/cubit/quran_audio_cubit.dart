import 'package:iu_mushaf/core/imports/imports.dart';
import 'package:iu_mushaf/features/quran_audio/data/models/sur_readers_audios_model.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

part 'quran_audio_state.dart';

class QuranAudioCubit extends Cubit<QuranAudioState> {
  QuranAudioCubit() : super(QuranAudioInitial());

  int selectedSurahNumber = 0;
  int selectedReciter = sl<Cache>().getIntData("reciter")!;
  SurReadersAudiosModel? surReadersAudiosModel;
  SurModel? surModel;
  String? language;

  AudioPlayer audioPlayer = sl<MediaPlayer>().audioPlayer;
  ConcatenatingAudioSource? playList;

  void init(
      {required SurReadersAudiosModel readersModel,
      required SurModel allSurModel,
      required String lang}) {
    surReadersAudiosModel = readersModel;
    surModel = allSurModel;
    language = lang;
    setAudioPLaylist();
  }

  //! Set Audio Playlist
  Future<void> setAudioPLaylist() async {
    playList = ConcatenatingAudioSource(
      children: List.generate(
        surReadersAudiosModel!.surReadersAudios[selectedReciter].surUrls.length,
        (index) {
          String url = surReadersAudiosModel!
              .surReadersAudios[selectedReciter].surUrls[index].url;
          if (url.startsWith("http://") || url.startsWith("https://")) {
            return AudioSource.uri(
              Uri.parse(url),
              tag: MediaItem(
                id: "$selectedSurahNumber",
                album: language == "en"
                    ? surReadersAudiosModel!
                        .surReadersAudios[selectedReciter].readerNameEnglish
                    : surReadersAudiosModel!
                        .surReadersAudios[selectedReciter].readerNameArabic,
                title: language == "en"
                    ? surModel!.sur[index].englishName
                    : surModel!.sur[index].name,
                artUri: Uri.parse(
                    'https://media.licdn.com/dms/image/D4D12AQHpCDFnrmJiiQ/article-cover_image-shrink_600_2000/0/1712430882115?e=2147483647&v=beta&t=D_y1vThNzKM8thNPMKpNy-f5g2t0ePFUXPUynynpmGk'),
              ),
            );
          } else {
            return AudioSource.asset(
              url,
              tag: MediaItem(
                id: "$selectedSurahNumber",
                album: language == "en"
                    ? surReadersAudiosModel!
                        .surReadersAudios[index].readerNameEnglish
                    : surReadersAudiosModel!
                        .surReadersAudios[index].readerNameArabic,
                title: language == "en"
                    ? surModel!.sur[index].englishName
                    : surModel!.sur[index].name,
                artUri: Uri.parse(
                    'https://media.licdn.com/dms/image/D4D12AQHpCDFnrmJiiQ/article-cover_image-shrink_600_2000/0/1712430882115?e=2147483647&v=beta&t=D_y1vThNzKM8thNPMKpNy-f5g2t0ePFUXPUynynpmGk'),
              ),
            );
          }
        },
      ),
    );
  }

  Future<void> playSurah({int? initialIndex}) async {
    await audioPlayer.setAudioSource(
      playList!,
      initialIndex: initialIndex ?? 0,
      preload: false,
    );
    await audioPlayer.setLoopMode(LoopMode.all);
    audioPlayer.play();
  }

  //! Audio Seek
  Future audioPlayerSeek(value) async {
    await audioPlayer.seek(Duration(seconds: value.toInt()));
    emit(AudioPlayerSeekState());
  }

  //! Play & Pause Toggle
  Future<void> playAndPauseToggle() async {
    audioPlayer.playing ? audioPlayer.pause() : audioPlayer.play();
    emit(SelectSurahState());
  }

  //! Change Reciter
  void changeReciter(int index) {
    if (selectedReciter != index) {
      final int currentSurah = audioPlayer.currentIndex!;
      selectedReciter = index;
      sl<Cache>().setData("reciter", selectedReciter);
      audioPlayer.stop();
      setAudioPLaylist();
      playSurah(initialIndex: currentSurah);
      emit(ChangeReciterState());
    }
  }
}
