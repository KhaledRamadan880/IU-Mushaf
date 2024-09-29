import 'package:iu_mushaf/core/imports/imports.dart';

part 'mushaf_state.dart';

class MushafCubit extends Cubit<MushafState> {
  MushafCubit() : super(MushafInitial());

  dynamic focusedAyahNumber;
  changeFocusedAyah(index) {
    focusedAyahNumber = index;
    emit(ChageFocusedAyahState());
  }

  //! Hide Layout
  bool isLayoutHiddin = false;
  changeLayoutVisibility() {
    isLayoutHiddin = !isLayoutHiddin;
    emit(ChangeOverlayVisibilityState());
  }

  hideLayoutAfterNavigate() {
    Future.delayed(
        const Duration(milliseconds: 1250), () => changeLayoutVisibility());
  }
}
