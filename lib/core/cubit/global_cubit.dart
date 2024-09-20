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
}
