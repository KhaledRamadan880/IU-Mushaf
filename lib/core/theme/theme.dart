import 'package:iu_mushaf/core/imports/imports.dart';

ThemeData lightTheme() {
  return ThemeData(
    scaffoldBackgroundColor: const Color(0xffF6FAFC),
    primaryColor: const Color(0xffFCD2BC),
    secondaryHeaderColor: AppColors.white,
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: Color(0xffFCD2BC),
      selectionHandleColor: Color(0xffFCD2BC),
    ),
  );
}

ThemeData darkTheme() {
  return ThemeData(
    scaffoldBackgroundColor: const Color(0xff1C1B1B),
    primaryColor: const Color(0xffFCD2BC),
    secondaryHeaderColor: const Color(0xff202020),
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: Color(0xffFCD2BC),
      selectionHandleColor: Color(0xffFCD2BC),
    ),
  );
}
