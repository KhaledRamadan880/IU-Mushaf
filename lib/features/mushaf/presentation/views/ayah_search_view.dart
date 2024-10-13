import 'package:iu_mushaf/core/imports/imports.dart';
import 'package:iu_mushaf/features/mushaf/data/models/surah_model.dart';
import 'package:iu_mushaf/features/quran_audio/presentation/widgets/surah_number_container.dart';

class AyahSearchView extends StatelessWidget {
  const AyahSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MushafCubit, MushafState>(
        builder: (context, state) {
          final cubit = context.read<MushafCubit>();
          return Column(
            children: [
              //! Search Row
              Container(
                color: Theme.of(context).secondaryHeaderColor,
                padding: EdgeInsets.only(
                  left: 16.responsiveWidth(context),
                  right: 16.responsiveWidth(context),
                  bottom: 16.responsiveHeight(context),
                  top: 48.responsiveHeight(context),
                ),
                child: Row(
                  children: [
                    //! Search Text Field
                    Expanded(
                      child: CustomTextField(
                        focusNode: cubit.ayahsSearchFocusNode,
                        controller: cubit.ayahsSearchController,
                        onChanged: (value) {
                          cubit.ayahsSearch(value);
                        },
                      ),
                    ),
                    SizedBox(width: 8.responsiveWidth(context)),
                    //! Cancel Text Button
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        cubit.searchedAyahs.clear();
                        cubit.ayahsSearchController.clear();
                      },
                      child: CustomText(
                        AppStrings.cancel.tr(context),
                        style: Styles.style16(context),
                      ),
                    ),
                  ],
                ),
              ),
              //! List View
              cubit.ayahsSearchController.value.text.isNotEmpty
                  ? cubit.searchedAyahs.isNotEmpty
                      ? Expanded(
                          child: ListView.builder(
                            itemCount: cubit.searchedAyahs.length,
                            itemBuilder: (context, index) {
                              SurahModel surah =
                                  cubit.getSurahFromSearchedAyahs(index);
                              int pageNumber =
                                  cubit.getPageNumberForAyahSearch(index);
                              return AyahSearchedCard(
                                surahName:
                                    context.read<GlobalCubit>().language == "en"
                                        ? surah.englishName
                                        : surah.name,
                                surahNumber: surah.number,
                                ayah: cubit.searchedAyahs[index].qcfData,
                                pageNumber: pageNumber,
                                onTap: () {
                                  Navigator.pop(context);
                                  cubit.quranPageController!
                                      .jumpToPage(pageNumber);

                                  cubit.changeFocusedAyah(
                                      cubit.searchedAyahs[index].numberInQuran);

                                  cubit.addBookmarksData(
                                    surahNumber: surah.number,
                                    surahNameEn: surah.englishName,
                                    surahNameAr: surah.englishName,
                                    ayahText:
                                        cubit.searchedAyahs[index].qcfData,
                                  );
                                  cubit.ayahsSearchController.clear();
                                  cubit.searchedAyahs.clear();
                                },
                              );
                            },
                          ),
                        )
                      : Expanded(
                          child: Center(
                            child: CustomText(
                              AppStrings.thereIsNoResults.tr(context),
                              style: Styles.style28Bold(context),
                            ),
                          ),
                        )
                  : Expanded(
                      child: Center(
                        child: CustomText(
                          AppStrings.searhForAyah.tr(context),
                          style: Styles.style28Bold(context),
                        ),
                      ),
                    ),
            ],
          );
        },
      ),
    );
  }
}

class AyahSearchedCard extends StatelessWidget {
  const AyahSearchedCard({
    super.key,
    required this.surahName,
    required this.ayah,
    required this.surahNumber,
    required this.pageNumber,
    required this.onTap,
  });

  final String surahName, ayah;
  final int surahNumber;
  final int pageNumber;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.responsiveWidth(context),
          vertical: 16.responsiveHeight(context),
        ),
        margin: EdgeInsets.only(
          left: 24.responsiveWidth(context),
          right: 24.responsiveWidth(context),
          bottom: 16.responsiveHeight(context),
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).secondaryHeaderColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          children: [
            //! Surah Name
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //! Surah Number
                SurahNumberContainer(surahNumber - 1),
                SizedBox(width: 4.responsiveWidth(context)),
                //! Surah Name
                CustomText(
                  (context.read<GlobalCubit>().language == "ar"
                          ? "${AppStrings.surah.tr(context)} "
                          : "") +
                      surahName,
                  style: Styles.style18SemiBold(context),
                ),
              ],
            ),
            SizedBox(height: 8.responsiveHeight(context)),
            //! Ayah
            CustomText(
              ayah,
              style: Styles.style16(context).copyWith(
                overflow: TextOverflow.clip,
                fontFamily: "page${pageNumber + 1}",
              ),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              lightColor: AppColors.green,
            ),
            SizedBox(height: 8.responsiveHeight(context)),
            //! Page Number
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomText(
                  "${AppStrings.page.tr(context)} ${pageNumber + 1}",
                  style: Styles.style12(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
