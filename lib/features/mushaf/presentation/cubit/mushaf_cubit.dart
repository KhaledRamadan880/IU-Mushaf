import 'package:iu_mushaf/core/imports/imports.dart';
import 'package:iu_mushaf/features/mushaf/data/models/ayah_model.dart';


part 'mushaf_state.dart';

class MushafCubit extends Cubit<MushafState> {
  MushafCubit() : super(MushafInitial());

  //! Fouces on Ayah 
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

  //* Reading
  int pageNumber = 1;
  int surahNumber = 1;
  List<List<AyahModel>> readingPageAyahs = [];
  late SurModel surModel;

  readingPageSwip(DragEndDetails details) {
    focusedAyahNumber = null;

    //! For Swip Forward
    if (details.primaryVelocity! > 0 &&
        pageNumber != surModel.sur.last.ayahs.last.page) {
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
    for (var i = 0; i < surModel.sur.length; i++) {
      List<AyahModel> ayahsInCurrentSur = [];
      for (var x = 0; x < surModel.sur[i].ayahs.length; x++) {
        if (surModel.sur[i].ayahs[x].page == pageNumber) {
          ayahsInCurrentSur.add(surModel.sur[i].ayahs[x]);
        }
      }
      if (ayahsInCurrentSur.isNotEmpty) {
        readingPageAyahs.add(ayahsInCurrentSur);
      }
    }

    outerLoop:
    for (var surah in surModel.sur) {
      for (var ayah in surah.ayahs) {
        if (ayah.ayahNumber == readingPageAyahs.first.first.ayahNumber) {
          surahNumber = surah.number;
          break outerLoop;
        }
      }
    }
  }
}
