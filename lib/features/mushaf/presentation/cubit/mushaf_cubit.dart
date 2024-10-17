import 'dart:convert';

import 'package:iu_mushaf/core/imports/imports.dart';
import 'package:iu_mushaf/features/bookmark/data/models/bookmark_item_model.dart';
import 'package:iu_mushaf/features/bookmark/data/models/bookmarks_model.dart';
import 'package:iu_mushaf/features/mushaf/data/models/ayah_model.dart';
import 'package:iu_mushaf/features/mushaf/data/models/ayahs_reciters_audios_model.dart';
import 'package:iu_mushaf/features/mushaf/data/models/surah_model.dart';
import 'package:iu_mushaf/features/mushaf/data/models/surahs_model.dart';
import 'package:iu_mushaf/features/mushaf/data/models/tafser_model.dart';
import 'package:iu_mushaf/features/mushaf/data/page_data.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

part 'mushaf_state.dart';

class MushafCubit extends Cubit<MushafState> {
  MushafCubit() : super(MushafInitial());

  bool? wasPlaying;

  AyahsRecitersAudiosModel? ayahsRecitersAudiosModel;
  void init({
    required AyahsRecitersAudiosModel ayahsAudiosModel,
    required BookmarksModel globalBookmarksModel,
    required String mushafEn,
    required String mushafAr,
    int? initPageNumber,
    int? narraterId,
  }) {
    ayahsRecitersAudiosModel = ayahsAudiosModel;
    bookmarksModel = globalBookmarksModel;
    mushafTypeEn = mushafEn;
    mushafTypeAr = mushafAr;
    quranPageController = PageController(initialPage: initPageNumber ?? 0);
    isLayoutHiddin = false;
    reciterId = narraterId;
    hideLayoutAfterNavigate();
  }

  @override
  Future<void> close() async {
    super.close();
    audioPlayer!.stop();
  }

  //! Fouces on Ayah
  dynamic focusedAyahNumber;
  dynamic focusedAyahNumberInSurah;
  changeFocusedAyah(index) {
    focusedAyahNumber = index;
    emit(ChageFocusedAyahState());
  }

  //! Hide Layout
  bool isLayoutHiddin = false;
  changeLayoutVisibility() {
    isLayoutHiddin = !isLayoutHiddin;
    emit(ChangeOverlayVisibilityState());
  }

  hideLayoutAfterNavigate() {
    Future.delayed(
        const Duration(milliseconds: 2000), () => changeLayoutVisibility());
  }

  //* Reading
  int pageNumber = 1;
  int surahNumber = 1;
  SurahsModel? surahsModel;

  changePage(value) {
    pageNumber = value + 1;
    emit(ChangePageState());
  }

  //! Listen To Ayah
  int nowPlayingAyah = 0;
  int? reciterId;
  AudioPlayer? audioPlayer = sl<MediaPlayer>().listenToAyahPlayer;
  Future playAyah() async {
    final String url = ayahsRecitersAudiosModel!
        .reciters[(reciterId ?? 1) - 1].ayahsUrls[focusedAyahNumber - 1].url;
    nowPlayingAyah = ayahsRecitersAudiosModel!.reciters[(reciterId ?? 1) - 1]
        .ayahsUrls[focusedAyahNumber - 1].ayahNumber;
    await sl<MediaPlayer>().audioPlayer.stop();
    if (url.startsWith("http://") || url.startsWith("https://")) {
      audioPlayer!.setUrl(
        url,
        tag: MediaItem(
          id: "",
          album: "",
          title: "",
          artUri: Uri.parse(
              'https://media.licdn.com/dms/image/D4D12AQHpCDFnrmJiiQ/article-cover_image-shrink_600_2000/0/1712430882115?e=2147483647&v=beta&t=D_y1vThNzKM8thNPMKpNy-f5g2t0ePFUXPUynynpmGk'),
        ),
      );
    } else {
      audioPlayer!.setAsset(
        url,
        tag: MediaItem(
          id: "",
          album: "",
          title: "",
          artUri: Uri.parse(
              'https://media.licdn.com/dms/image/D4D12AQHpCDFnrmJiiQ/article-cover_image-shrink_600_2000/0/1712430882115?e=2147483647&v=beta&t=D_y1vThNzKM8thNPMKpNy-f5g2t0ePFUXPUynynpmGk'),
        ),
      );
    }
    try {
      await audioPlayer!.play();
    } catch (e) {
      await audioPlayer!.stop();
    }
    audioPlayer!.processingStateStream.listen((playerState) async {
      if (playerState == ProcessingState.completed) {
        await audioPlayer!.stop();
      }
    });
  }

  //! Play Recitation
  Future playRecitation({required String url}) async {
    await sl<MediaPlayer>().audioPlayer.stop();
    if (url.startsWith("http://") || url.startsWith("https://")) {
      audioPlayer!.setUrl(
        url,
        tag: MediaItem(
          id: "",
          album: "",
          title: "",
          artUri: Uri.parse(
              'https://media.licdn.com/dms/image/D4D12AQHpCDFnrmJiiQ/article-cover_image-shrink_600_2000/0/1712430882115?e=2147483647&v=beta&t=D_y1vThNzKM8thNPMKpNy-f5g2t0ePFUXPUynynpmGk'),
        ),
      );
    } else {
      audioPlayer!.setAsset(
        url,
        tag: MediaItem(
          id: "",
          album: "",
          title: "",
          artUri: Uri.parse(
              'https://media.licdn.com/dms/image/D4D12AQHpCDFnrmJiiQ/article-cover_image-shrink_600_2000/0/1712430882115?e=2147483647&v=beta&t=D_y1vThNzKM8thNPMKpNy-f5g2t0ePFUXPUynynpmGk'),
        ),
      );
    }
    try {
      await audioPlayer!.play();
    } catch (e) {
      await audioPlayer!.stop();
    }
    audioPlayer!.processingStateStream.listen((playerState) async {
      if (playerState == ProcessingState.completed) {
        await audioPlayer!.stop();
      }
    });
  }

  //! Add Bookmark
  int? focusedSurahNumber;
  String? focusedSurahNameEn;
  String? focusedSurahNameAr;
  String? focusedAyahText;
  String? mushafTypeEn;
  String? mushafTypeAr;
  BookmarksModel? bookmarksModel;
  PageController? quranPageController;
  void addBookmark() {
    emit(AddBookmarkLoadingState());
    BookmarksModel model = bookmarksModel!;
    model.bookmarks.insert(
      0,
      BookmarkItemModel(
        surahNameEn: focusedSurahNameEn!,
        surahNameAr: focusedSurahNameAr!,
        ayahText: focusedAyahText!,
        mushafTypeEn: mushafTypeEn!,
        mushafTypeAr: mushafTypeAr!,
        surahNumber: focusedSurahNumber!,
        pageNumber: pageNumber,
      ),
    );
    String newJsonString = jsonEncode(model.toMap());
    sl<Cache>().setData("bookmarks", newJsonString);
    emit(AddBookmarkSuccessState());
  }

  addBookmarksData({
    required int surahNumber,
    required String surahNameEn,
    required String surahNameAr,
    required String ayahText,
  }) {
    focusedSurahNumber = surahNumber;
    focusedSurahNameEn = surahNameEn;
    focusedSurahNameAr = surahNameAr;
    focusedAyahText = ayahText;
  }

  //! Tafser
  TafserModel? tafserModel;

  //! Search
  //* Surahs Search
  TextEditingController surahsSearchController = TextEditingController();
  bool showSurahsSearchTextField = false;
  FocusNode surahsSearchFocusNode = FocusNode();

  void changeSurahsSearchTextFieldVisibility(bool isVisible) {
    showSurahsSearchTextField = isVisible;
    emit(ChangeSurahsSearchTextFieldVisibilityState());
  }

  List<SurahModel> searchedSur = [];
  void surahsSearch(String value) {
    searchedSur.clear();
    if (value.isNotEmpty) {
      for (var surah in surahsModel!.surahs) {
        if (removeArabicDiacritics(surah.name)
                .contains(removeArabicDiacritics(value)) ||
            surah.englishName.toLowerCase().contains(value.toLowerCase())) {
          searchedSur.add(surahsModel!.surahs[surah.number - 1]);
        }
      }
    }
    emit(SurahsSearchOnChangeState());
  }

  //* Ayahs Search
  TextEditingController ayahsSearchController = TextEditingController();
  bool showAyahsSearchTextField = false;
  FocusNode ayahsSearchFocusNode = FocusNode();

  void changeAyahsSearchTextFieldVisibility(bool isVisible) {
    showSurahsSearchTextField = isVisible;
    emit(ChangeAyahSearchTextFieldVisibilityState());
  }

  List<AyahModel> searchedAyahs = [];
  void ayahsSearch(String value) {
    searchedAyahs.clear();
    if (value.isNotEmpty) {
      for (var surah in surahsModel!.surahs) {
        for (var ayah in surah.ayahs.ayahs) {
          if (removeArabicDiacritics(ayah.content)
              .contains(removeArabicDiacritics(value))) {
            searchedAyahs.add(ayah);
          }
        }
      }
    }
    emit(AyahsSearchOnChangeState());
  }

  getSurahFromSearchedAyahs(index) {
    for (var surah in surahsModel!.surahs) {
      for (var ayah in surah.ayahs.ayahs) {
        if (ayah.numberInQuran == searchedAyahs[index].numberInQuran) {
          return surah;
        }
      }
    }
  }

  getPageNumberFromSurahSearch(index, GlobalCubit cubit) {
    int surahNumber = searchedSur.isNotEmpty
        ? searchedSur[index].number
        : cubit.surahsModel!.surahs[index].number;
    for (var i = 0; i < pageData.length; i++) {
      for (var ii = 0; ii < pageData[i].length; ii++) {
        if (pageData[i][ii]["surah"] == surahNumber &&
            pageData[i][ii]["start"] == 1) {
          return i;
        }
      }
    }
    emit(GetPageNumberState());
  }

  int getPageNumberForAyahSearch(index) {
    int surahNumber = searchedAyahs[index].surahNumber;
    for (var i = 0; i < pageData.length; i++) {
      for (var ii = 0; ii < pageData[i].length; ii++) {
        if (pageData[i][ii]["surah"] == surahNumber &&
            (searchedAyahs[index].verseNumber >= pageData[i][ii]["start"] &&
                searchedAyahs[index].verseNumber <= pageData[i][ii]["end"])) {
          return i;
        }
      }
    }
    return 0;
  }

  String removeArabicDiacritics(String text) {
    RegExp regExp = RegExp(
        r'[\u064B-\u065F\u0618-\u061A\u06D6-\u06DC\u06DF-\u06E8\u06EA-\u06ED]');

    String cleanedText = text.replaceAll(regExp, '');

    cleanedText = cleanedText.replaceAll('ٱ', 'ا');
    cleanedText = cleanedText.replaceAll('إ', 'ا');
    cleanedText = cleanedText.replaceAll('أ', 'ا');
    cleanedText = cleanedText.replaceAll('آ', 'ا');
    cleanedText = cleanedText.replaceAll('ى', 'ي');
    cleanedText = cleanedText.replaceAll('ؤ', 'و');
    cleanedText = cleanedText.replaceAll('ئ', 'ي');

    return cleanedText;
  }
}
