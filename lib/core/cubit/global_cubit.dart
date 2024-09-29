import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:iu_mushaf/core/imports/imports.dart';
import 'package:iu_mushaf/features/mushaf/data/models/ayah_model.dart';
import 'package:iu_mushaf/features/mushaf/data/models/mushafs_model.dart';
import 'package:iu_mushaf/features/mushaf/data/models/sur_model.dart';

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

  //! Mushaf
  MushafsModel? mushafsModel = MushafsModel(mushafs: MushafsModel.allMushafs);

  SurModel? surModel;
  Future loadMushafFromJson() async {
    String jsonString = await rootBundle.loadString("assets/json/quran.json");
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    surModel = SurModel.fromJson(jsonMap);
  }

  //* Reading
  int pageNumber = 1;
  int surahNumber = 1;
  List<List<AyahModel>> readingPageAyahs = [];

  readingPageSwip(DragEndDetails details) {
    //! For Swip Forward
    if (details.primaryVelocity! > 0 &&
        pageNumber != surModel!.sur.last.ayahs.last.page) {
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
    for (var i = 0; i < surModel!.sur.length; i++) {
      List<AyahModel> ayahsInCurrentSur = [];
      for (var x = 0; x < surModel!.sur[i].ayahs.length; x++) {
        if (surModel!.sur[i].ayahs[x].page == pageNumber) {
          ayahsInCurrentSur.add(surModel!.sur[i].ayahs[x]);
        }
      }
      if (ayahsInCurrentSur.isNotEmpty) {
        readingPageAyahs.add(ayahsInCurrentSur);
      }
    }

    outerLoop:
    for (var surah in surModel!.sur) {
      for (var ayah in surah.ayahs) {
        if (ayah.ayahNumber == readingPageAyahs.first.first.ayahNumber) {
          surahNumber = surah.number;
          break outerLoop;
        }
      }
    }
  }
}
