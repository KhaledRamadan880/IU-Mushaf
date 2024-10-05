import 'package:iu_mushaf/core/imports/imports.dart';
import 'package:iu_mushaf/features/mushaf/data/models/surah_model.dart';
import 'package:iu_mushaf/features/quran_audio/data/models/sur_reciters_audios_model.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

part 'quran_audio_state.dart';

class QuranAudioCubit extends Cubit<QuranAudioState> {
  QuranAudioCubit() : super(QuranAudioInitial());

  int selectedSurahNumber = 0;
  int selectedReciter = sl<Cache>().getIntData("reciter") ?? 0;
  SurRecitersAudiosModel? surrecitersAudiosModel;
  SurModel? surModel;
  String? language;

  AudioPlayer audioPlayer = sl<MediaPlayer>().audioPlayer;
  ConcatenatingAudioSource? playList;

  void init(
      {required SurRecitersAudiosModel recitersModel,
      required SurModel allSurModel,
      required String lang}) {
    surrecitersAudiosModel = recitersModel;
    surModel = allSurModel;
    language = lang;
    setAudioPLaylist();
  }

  //! Set Audio Playlist
  Future<void> setAudioPLaylist() async {
    playList = ConcatenatingAudioSource(
      children: List.generate(
        surrecitersAudiosModel!
            .surrecitersAudios[selectedReciter].surUrls.length,
        (index) {
          String url = surrecitersAudiosModel!
              .surrecitersAudios[selectedReciter].surUrls[index].url;
          if (url.startsWith("http://") || url.startsWith("https://")) {
            return AudioSource.uri(
              Uri.parse(url),
              tag: MediaItem(
                id: surrecitersAudiosModel!.surrecitersAudios[selectedReciter]
                    .surUrls[index].surahNumber
                    .toString(),
                artist: language == "en"
                    ? surrecitersAudiosModel!
                        .surrecitersAudios[selectedReciter].reciterNameEnglish
                    : surrecitersAudiosModel!
                        .surrecitersAudios[selectedReciter].reciterNameArabic,
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
                id: surrecitersAudiosModel!.surrecitersAudios[selectedReciter]
                    .surUrls[index].surahNumber
                    .toString(),
                artist: language == "en"
                    ? surrecitersAudiosModel!
                        .surrecitersAudios[index].reciterNameEnglish
                    : surrecitersAudiosModel!
                        .surrecitersAudios[index].reciterNameArabic,
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

  //! Search
  TextEditingController searchController = TextEditingController();
  bool showSearchTextField = false;
  FocusNode searchFocusNode = FocusNode();

  void changeSearchTextFieldVisibility(bool isVisible) {
    showSearchTextField = isVisible;
    emit(ChangeSearchTextFieldVisibilityState());
  }

  List<SurahModel> searchedSur = [];
  void search(String value) {
    searchedSur.clear();
    if (value.isNotEmpty) {
      for (var surah in surModel!.sur) {
        if (removeArabicDiacritics(surah.name).contains(value) ||
            surah.englishName.toLowerCase().contains(value.toLowerCase())) {
          searchedSur.add(surModel!.sur[surah.number - 1]);
        }
      }
    }
    emit(SearchOnChangeState());
  }

  String removeArabicDiacritics(String text) {
    RegExp regExp = RegExp(
        r'[\u064B-\u065F\u0670-\u0672\u0674-\u0675\u0678-\u0679\u06D6-\u06ED]');

    String cleanedText = text.replaceAll(regExp, '');

    cleanedText = cleanedText.replaceAll('ٱ', 'ا');

    cleanedText = cleanedText.replaceAll('ل', 'ل'); // Ensure space remains
    return text.replaceAll(regExp, '');
  }
}
