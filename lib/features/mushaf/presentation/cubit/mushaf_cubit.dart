import 'dart:convert';

import 'package:iu_mushaf/core/imports/imports.dart';
import 'package:iu_mushaf/features/bookmark/data/models/bookmark_item_model.dart';
import 'package:iu_mushaf/features/bookmark/data/models/bookmarks_model.dart';
import 'package:iu_mushaf/features/mushaf/data/models/ayah_model.dart';
import 'package:iu_mushaf/features/mushaf/data/models/ayahs_reciters_audios_model.dart';
import 'package:iu_mushaf/features/mushaf/data/models/tafser_model.dart';
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
  }) {
    ayahsRecitersAudiosModel = ayahsAudiosModel;
    bookmarksModel = globalBookmarksModel;
    mushafTypeEn = mushafEn;
    mushafTypeAr = mushafAr;
    pageNumber = initPageNumber ?? 1;
    addAyahsToList();
  }

  @override
  Future<void> close() async {
    super.close();
    audioPlayer!.stop();
  }

  //! Fouces on Ayah
  dynamic focusedAyahNumber;
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
        const Duration(milliseconds: 1250), () => changeLayoutVisibility());
  }

  //* Reading
  int pageNumber = 1;
  int surahNumber = 1;
  List<List<AyahModel>> readingPageAyahs = [];
  late SurModel surModel;

  readingPageSwip(DragEndDetails details) {
    focusedAyahNumber = null;

    //! For Swip Forward
    if (details.primaryVelocity! > 0 &&
        pageNumber != surModel.sur.last.ayahs.last.page) {
      pageNumber += 1;

      addAyahsToList();
    }
    //! For Swip Back
    else if (details.primaryVelocity! < 0 && pageNumber > 1) {
      pageNumber -= 1;
      addAyahsToList();
    }
    emit(ReadingPageSwipState());
  }

  void addAyahsToList() {
    readingPageAyahs.clear();
    for (var i = 0; i < surModel.sur.length; i++) {
      List<AyahModel> ayahsInCurrentSur = [];
      for (var x = 0; x < surModel.sur[i].ayahs.length; x++) {
        if (surModel.sur[i].ayahs[x].page == pageNumber) {
          ayahsInCurrentSur.add(surModel.sur[i].ayahs[x]);
        }
      }
      if (ayahsInCurrentSur.isNotEmpty) {
        readingPageAyahs.add(ayahsInCurrentSur);
      }
    }

    outerLoop:
    for (var surah in surModel.sur) {
      for (var ayah in surah.ayahs) {
        if (ayah.ayahNumber == readingPageAyahs.first.first.ayahNumber) {
          surahNumber = surah.number;
          break outerLoop;
        }
      }
    }
  }

  //! Listen To Ayah
  int nowPlayingAyah = 0;
  AudioPlayer? audioPlayer = sl<MediaPlayer>().listenToAyahPlayer;
  Future playAyah() async {
    final String url = ayahsRecitersAudiosModel!
        .reciters[0].ayahsUrls[focusedAyahNumber - 1].url;
    nowPlayingAyah = ayahsRecitersAudiosModel!
        .reciters[0].ayahsUrls[focusedAyahNumber - 1].ayahNumber;
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

  void addBookmark() {
    emit(AddBookmarkLoadingState());
    BookmarksModel model = bookmarksModel!;
    model.bookmarks.insert(
      0,
      BookmarkItemModel(
        surahNameEn: focusedSurahNameEn!,
        surahNameAr: focusedSurahNameAr!,
        ayahText:
            "${focusedAyahText!} (${surModel.sur[focusedSurahNumber! - 1].ayahs[focusedAyahNumber - 1].numberInSurah})",
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

  //! Tafser
  TafserModel? tafserModel;
}
