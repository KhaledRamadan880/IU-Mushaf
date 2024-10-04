import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:iu_mushaf/core/imports/imports.dart';
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

  //! Mushaf
  MushafsModel? mushafsModel = MushafsModel(mushafs: MushafsModel.allMushafs);
  SurModel? surModel;

  Future loadMushafFromJson() async {
    String jsonString = await rootBundle.loadString("assets/json/quran.json");
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    surModel = SurModel.fromJson(jsonMap);
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
}
