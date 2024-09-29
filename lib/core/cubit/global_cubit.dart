import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:iu_mushaf/core/imports/imports.dart';

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
}
