import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:iu_mushaf/core/local/app_loacl.dart';

//!  localizationsDelegatesList
const localizationsDelegatesList = [
  GlobalMaterialLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  AppLocalizations.delegate,
];

//!  supportedLocalesList
const supportedLocalesList = [
  Locale('ar', "EG"),
  Locale('en', "US"),
];
