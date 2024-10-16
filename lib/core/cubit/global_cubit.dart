import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:iu_mushaf/core/imports/imports.dart';
import 'package:iu_mushaf/features/bookmark/data/models/bookmarks_model.dart';
import 'package:iu_mushaf/features/mushaf/data/models/ayahs_model.dart';
import 'package:iu_mushaf/features/mushaf/data/models/ayahs_reciters_audios_model.dart';
import 'package:iu_mushaf/features/mushaf/data/models/recitations_model.dart';
import 'package:iu_mushaf/features/mushaf/data/models/surahs_model.dart';
import 'package:iu_mushaf/features/mushaf/data/models/tafsers_model.dart';
import 'package:iu_mushaf/features/quran_audio/data/models/sur_reciters_audios_model.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  //! Language
  String language = sl<Cache>().getStringData("language") ?? "en";
  void changeLanguage(String newlanguage) {
    sl<Cache>().setData("language", newlanguage);
    language = newlanguage;
    emit(ChangeLanguageState());
  }

  //! Theme Mod
  bool isDark = sl<Cache>().getBoolData("IsDark") ?? false;
  changeThemeMod() {
    isDark = !isDark;
    sl<Cache>().setData("IsDark", isDark);
    emit(ChangeThemeModState());
  }

  //! Push Notification
  bool isPushNotification =
      sl<Cache>().getBoolData("IsPushNotification") ?? false;
  changeNotificationPermission() {
    isPushNotification = !isPushNotification;
    sl<Cache>().setData("IsPushNotification", isPushNotification);
    emit(ChangeNotificationPermissionState());
  }

  //! Bottom Navigation Bar
  PersistentTabController navBarController = PersistentTabController();
  bool isNavBarVisible = true;
  void navBarVisibliltyToggle(value) {
    isNavBarVisible = value;
    emit(NavBarVisibliltyToggleState());
  }

  inital() {
    loadSurahsAndAyahsFromJson();
    loadRecitationsFromJson();
    loadSurAudiosFromJson();
    loadAyahsFromJson();
    loadTafsersFromJson();
    getBookmarks();
  }

  //! Mushaf
  MushafsModel? mushafsModel = MushafsModel(mushafs: MushafsModel.allMushafs);

  //! Load Surahs & Ayahs From Json
  SurahsModel? surahsModel;
  AyahsModel? ayahsModel;
  Future<void> loadSurahsAndAyahsFromJson() async {
    String surahsJsonString =
        await rootBundle.loadString("assets/json/surahs.json");
    String ayahsJsonString =
        await rootBundle.loadString("assets/json/ayahs.json");

    Map<String, dynamic> surahsMap = jsonDecode(surahsJsonString);
    Map<String, dynamic> ayahsMap = jsonDecode(ayahsJsonString);

    ayahsModel = AyahsModel.fromJson(ayahsMap);
    surahsModel = SurahsModel.fromJson(surahsMap, ayahsModel!);
  }

  //! Load Recitaions
  RecitationsModel? recitationsModel;
  Future<void> loadRecitationsFromJson() async {
    String recitationsJsonString =
        await rootBundle.loadString("assets/json/recitation-data.json");
    Map<String, dynamic> recitationsMap = jsonDecode(recitationsJsonString);
    recitationsModel = RecitationsModel.fromJson(recitationsMap);
  }

  //! Load Sur Audios
  SurRecitersAudiosModel? surrecitersAudiosModel;
  Future<void> loadSurAudiosFromJson() async {
    emit(LoadSurreciterLoadingState());
    String jsonString =
        await rootBundle.loadString("assets/json/sur_reciters_audios.json");
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    surrecitersAudiosModel = SurRecitersAudiosModel.fromJson(jsonMap);
    emit(LoadSurreciterSuccessState());
  }

  //! Load Ayahs Audios
  AyahsRecitersAudiosModel? ayahsRecitersAudiosModel;
  Future<void> loadAyahsFromJson() async {
    String jsonString =
        await rootBundle.loadString("assets/json/ayahs_reciters_audios.json");
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    ayahsRecitersAudiosModel = AyahsRecitersAudiosModel.fromJson(jsonMap);
  }

  //! Load Tafser From Json
  TafsersModel? tafsersModel;
  Future<void> loadTafsersFromJson() async {
    String jsonString = await rootBundle.loadString("assets/json/tafser.json");
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    tafsersModel = TafsersModel.fromJson(jsonMap);
  }

  //! Get Bookmarks from Cache
  BookmarksModel? bookmarksModel;
  Future<void> getBookmarks() async {
    emit(GetBookmarksLoadingState());
    String jsonString = sl<Cache>().getStringData("bookmarks") ?? "null";
    if (jsonString != "null") {
      Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      bookmarksModel = BookmarksModel.fromJson(jsonMap);
    } else {
      bookmarksModel = BookmarksModel(bookmarks: []);
      emit(GetBookmarksSuccessState());
    }
  }

  //! Delete Bookmark
  void deleteAyah(index) {
    emit(DeleteAyahLoadingState());
    BookmarksModel model = bookmarksModel!;
    model.bookmarks.removeAt(index);
    String newJsonString = jsonEncode(model.toMap());
    sl<Cache>().setData("bookmarks", newJsonString);
    getBookmarks();
    emit(DeleteAyahSuccessState());
  }
}
