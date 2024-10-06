part of 'global_cubit.dart';

sealed class GlobalState {}

final class GlobalInitial extends GlobalState {}

final class ChangeLanguageState extends GlobalState {}

final class ChangeThemeModState extends GlobalState {}

final class ChangeNotificationPermissionState extends GlobalState {}

final class NavBarVisibliltyToggleState extends GlobalState {}

final class LoadSurreciterLoadingState extends GlobalState {}

final class LoadSurreciterSuccessState extends GlobalState {}

final class GetBookmarksLoadingState extends GlobalState {}

final class GetBookmarksSuccessState extends GlobalState {}

final class DeleteAyahLoadingState extends GlobalState {}

final class DeleteAyahSuccessState extends GlobalState {}
