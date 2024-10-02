part of 'global_cubit.dart';

sealed class GlobalState {}

final class GlobalInitial extends GlobalState {}

final class ChangeLanguageState extends GlobalState {}

final class ChangeThemeModState extends GlobalState {}

final class ChangeNotificationPermissionState extends GlobalState {}

final class NavBarVisibliltyToggleState extends GlobalState {}

final class LoadSurReaderLoadingState extends GlobalState {}

final class LoadSurReaderSuccessState extends GlobalState {}
