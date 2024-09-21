import 'package:iu_mushaf/core/imports/imports.dart';

ThemeData lightTheme() {
  return ThemeData(
    scaffoldBackgroundColor: const Color(0xffF6FAFC),
    primaryColor: const Color(0xffFCD2BC),
    secondaryHeaderColor: AppColors.white,
  );
}

ThemeData darkTheme() {
  return ThemeData(
    scaffoldBackgroundColor: const Color(0xff1C1B1B),
    primaryColor: const Color(0xffFCD2BC),
    secondaryHeaderColor: const Color(0xff202020),
  );
}
