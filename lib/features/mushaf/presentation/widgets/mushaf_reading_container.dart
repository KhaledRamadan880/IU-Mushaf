import 'package:flutter/gestures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iu_mushaf/core/imports/imports.dart';
import 'package:iu_mushaf/features/mushaf/data/page_data.dart';

class MushafReadingContainer extends StatelessWidget {
  const MushafReadingContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MushafCubit, MushafState>(builder: (context, state) {
      final cubit = context.read<MushafCubit>();
      return SizedBox(
        height: 675.responsiveHeight(context),
        child: PageView.builder(
            scrollDirection: Axis.horizontal,
            reverse:
                context.read<GlobalCubit>().language == "en" ? true : false,
            controller: cubit.quranPageController,
            itemCount: pageData.length,
            onPageChanged: (value) {
              cubit.changePage(value);
              cubit.changeFocusedAyah(null);
              cubit.audioPlayer!.pause();
            },
            itemBuilder: (context, index) {
              return Container(
                width: 357.responsiveWidth(context),
                height: 675.responsiveHeight(context),
                padding: EdgeInsets.symmetric(
                  horizontal: 8.responsiveWidth(context),
                  vertical: 5.responsiveHeight(context),
                ),
                margin: EdgeInsets.only(
                  top: 22.responsiveHeight(context),
                  left: 18.responsiveWidth(context),
                  right: 18.responsiveWidth(context),
                  bottom: 25.responsiveHeight(context),
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).secondaryHeaderColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  //! Rich Text
                  child: LayoutBuilder(builder: (context, constrains) {
                    return RichText(
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: List.generate(
                          pageData[index].length,
                          (i) {
                            int start = pageData[index][i]["start"];
                            int end = pageData[index][i]["end"];
                            return TextSpan(
                              children: List.generate(
                                end - start + 1,
                                (ii) {
                                  String qcfData = cubit
                                      .surahsModel!
                                      .surahs[pageData[index][i]["surah"] - 1]
                                      .ayahs
                                      .ayahs[ii + start - 1]
                                      .qcfData;
                                  int ayahNumberInQuran = cubit
                                      .surahsModel!
                                      .surahs[pageData[index][i]["surah"] - 1]
                                      .ayahs
                                      .ayahs[ii + start - 1]
                                      .numberInQuran;
                                  return TextSpan(
                                    children: [
                                      //! Surah Name Frame
                                      (cubit
                                                  .surahsModel!
                                                  .surahs[pageData[index][i]
                                                          ["surah"] -
                                                      1]
                                                  .ayahs
                                                  .ayahs[ii + start - 1]
                                                  .verseNumber ==
                                              1)
                                          ? surahFrame(context, cubit, index, i)
                                          : const TextSpan(),
                                      (index == 0 || index == 1) &&
                                              cubit
                                                      .surahsModel!
                                                      .surahs[pageData[index][i]
                                                              ["surah"] -
                                                          1]
                                                      .ayahs
                                                      .ayahs[ii + start - 1]
                                                      .verseNumber ==
                                                  1
                                          ? const TextSpan(text: "\n\n\n\n")
                                          : const TextSpan(text: ""),
                                      //! Basm Allah
                                      (cubit
                                                      .surahsModel!
                                                      .surahs[pageData[index][i]
                                                              ["surah"] -
                                                          1]
                                                      .ayahs
                                                      .ayahs[ii + start - 1]
                                                      .verseNumber ==
                                                  1) &&
                                              (index != 0 && index != 186)
                                          ? basmAllah(context)
                                          : const TextSpan(),
                                      //! Ayah
                                      TextSpan(
                                        text: qcfData.replaceAll(" ", ""),
                                        style: TextStyle(
                                          color:
                                              context.read<GlobalCubit>().isDark
                                                  ? AppColors.white
                                                  : AppColors.black,
                                          fontSize: 20.3.sp,
                                          wordSpacing: 0,
                                          letterSpacing: 0.w,
                                          height: 1.5.sp,
                                          fontFamily: "page${(index + 1)}",
                                          backgroundColor:
                                              (cubit.focusedAyahNumber ==
                                                      ayahNumberInQuran)
                                                  ? AppColors.lightBlue
                                                      .withOpacity(.4)
                                                  : AppColors.transparent,
                                        ),
                                        recognizer: LongPressGestureRecognizer()
                                          ..onLongPress = () {
                                            cubit.changeFocusedAyah(
                                                ayahNumberInQuran);
                                            cubit.addBookmarksData(
                                              surahNumber: cubit
                                                  .surahsModel!
                                                  .surahs[pageData[index][i]
                                                          ["surah"] -
                                                      1]
                                                  .number,
                                              surahNameEn: cubit
                                                  .surahsModel!
                                                  .surahs[pageData[index][i]
                                                          ["surah"] -
                                                      1]
                                                  .englishName,
                                              surahNameAr: cubit
                                                  .surahsModel!
                                                  .surahs[pageData[index][i]
                                                          ["surah"] -
                                                      1]
                                                  .name,
                                              ayahText: cubit
                                                  .surahsModel!
                                                  .surahs[pageData[index][i]
                                                          ["surah"] -
                                                      1]
                                                  .ayahs
                                                  .ayahs[ii + start - 1]
                                                  .qcfData,
                                            );
                                          },
                                      ),
                                    ],
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }),
                ),
              );
            }),
      );
    });
  }
}

surahFrame(BuildContext context, MushafCubit cubit, int index, int i) {
  return WidgetSpan(
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 4.responsiveHeight(context)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          //! Frame
          Image.asset(
            Assets.imagesSurahNameFrame,
            color: context.read<GlobalCubit>().isDark
                ? AppColors.white.withOpacity(.5)
                : AppColors.black.withOpacity(.5),
            height: 40.responsiveHeight(context),
            width: double.infinity,
            fit: BoxFit.fitHeight,
          ),
          //! Surah Name
          CustomText(
            cubit.surahsModel!.surahs[pageData[index][i]["surah"] - 1].name,
            style: Styles.style28Bold(context).copyWith(
              fontSize: 20.sp,
              fontFamily: "Uthman",
            ),
          ),
        ],
      ),
    ),
  );
}

basmAllah(BuildContext context) {
  return TextSpan(
    text: "ﱁ ﱂ ﱃ ﱄ\n",
    style: TextStyle(
      color: context.read<GlobalCubit>().isDark
          ? AppColors.white
          : AppColors.black,
      fontSize: 20.sp,
      wordSpacing: 0,
      letterSpacing: 0.w,
      height: 1.7.h,
      fontFamily: "page1",
    ),
  );
}
