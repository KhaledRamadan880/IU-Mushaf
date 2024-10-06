import 'package:flutter/gestures.dart';
import 'package:iu_mushaf/core/imports/imports.dart';

class MushafReadingContainer extends StatelessWidget {
  const MushafReadingContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MushafCubit, MushafState>(builder: (context, state) {
      final cubit = context.read<MushafCubit>();
      return GestureDetector(
        onHorizontalDragEnd: (details) {
          cubit.readingPageSwip(details);
        },
        child: Container(
          width: 357.responsiveWidth(context),
          height: 647.responsiveHeight(context),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              cubit.readingPageAyahs.length,
              (index1) {
                return Text.rich(
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  textWidthBasis: TextWidthBasis.parent,
                  TextSpan(
                    style: Styles.style18SemiBold(context).copyWith(
                      color: context.read<GlobalCubit>().isDark
                          ? AppColors.white
                          : AppColors.black,
                      fontFamily: "Uthman",
                      fontWeight: FontWeight.w700,
                      fontSize: 18 *
                          (MediaQuery.of(context).size.width /
                              345.responsiveWidth(context)),
                    ),
                    children: List.generate(
                      cubit.readingPageAyahs[index1].length,
                      (index2) {
                        return TextSpan(
                          children: [
                            if (cubit.readingPageAyahs[index1][index2]
                                    .numberInSurah ==
                                1)
                              TextSpan(
                                text:
                                    "${index1 > 0 ? "\n" : ""}❴ ${cubit.surModel.sur[(cubit.surahNumber - 1 + index1)].name} ❵\n",
                                style: TextStyle(
                                  fontSize: 25.responsiveText(context),
                                ),
                              ),
                            if (cubit.readingPageAyahs[index1][index2]
                                    .numberInSurah ==
                                1)
                              TextSpan(
                                text: cubit.readingPageAyahs[index1][0]
                                            .ayahNumber !=
                                        1
                                    ? "بِسۡمِ ٱللَّهِ ٱلرَّحۡمَٰنِ ٱلرَّحِيمِ\n"
                                    : "\n",
                                style: TextStyle(
                                    height: 1.7.responsiveHeight(context)),
                              ),
                            TextSpan(
                              text:
                                  "${cubit.readingPageAyahs[index1][index2].text}"
                                  "(${cubit.readingPageAyahs[index1][index2].numberInSurah}) ",
                              style: TextStyle(
                                backgroundColor: cubit
                                            .readingPageAyahs[index1][index2]
                                            .ayahNumber ==
                                        cubit.focusedAyahNumber
                                    ? AppColors.lightBlue.withOpacity(.5)
                                    : AppColors.transparent,
                              ),
                              recognizer: LongPressGestureRecognizer()
                                ..onLongPress = () {
                                  cubit.changeFocusedAyah(
                                    cubit.readingPageAyahs[index1][index2]
                                        .ayahNumber,
                                  );
                                  cubit.focusedSurahNumber = cubit
                                      .surModel
                                      .sur[(cubit.surahNumber - 1 + index1)]
                                      .number;
                                  cubit.focusedSurahNameEn = cubit
                                      .surModel
                                      .sur[(cubit.surahNumber - 1 + index1)]
                                      .englishName;
                                  cubit.focusedSurahNameAr = cubit
                                      .surModel
                                      .sur[(cubit.surahNumber - 1 + index1)]
                                      .name;
                                  cubit.focusedAyahText = cubit
                                      .readingPageAyahs[index1][index2].text;
                                },
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      );
    });
  }
}
