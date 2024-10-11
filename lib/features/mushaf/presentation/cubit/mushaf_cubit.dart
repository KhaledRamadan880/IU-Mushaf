import 'dart:convert';

import 'package:iu_mushaf/core/imports/imports.dart';
import 'package:iu_mushaf/features/bookmark/data/models/bookmark_item_model.dart';
import 'package:iu_mushaf/features/bookmark/data/models/bookmarks_model.dart';
import 'package:iu_mushaf/features/mushaf/data/models/ayahs_reciters_audios_model.dart';
import 'package:iu_mushaf/features/mushaf/data/models/surahs_model.dart';
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
    quranPageController = PageController(initialPage: initPageNumber ?? 0);
    isLayoutHiddin = false;
    hideLayoutAfterNavigate();
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
}
