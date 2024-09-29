import 'package:flutter/gestures.dart';
import 'package:iu_mushaf/core/imports/imports.dart';
import 'package:iu_mushaf/features/mushaf/presentation/cubit/mushaf_cubit.dart';

class MushafReadingContainer extends StatelessWidget {
  const MushafReadingContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCubit, GlobalState>(builder: (context, state) {
      final globalCubit = context.read<GlobalCubit>();

      return GestureDetector(
        onHorizontalDragEnd: (details) {
          globalCubit.readingPageSwip(details);
        },
        child: Container(
          width: 357.responsiveWidth(context),
          height: 647.responsiveHeight(context),
          padding: EdgeInsets.only(
            left: 8.responsiveWidth(context),
            right: 8.responsiveWidth(context),
            top: 20.responsiveHeight(context),
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
            children: [
              // BlocBuilder<GlobalCubit, GlobalState>(
              //   builder: (context, state) {
              //     return Padding(
              //       padding:
              //           EdgeInsets.only(bottom: 14.responsiveHeight(context)),
              //       child: Image.asset(
              //         Assets.imagesBesmAllah,
              //         height: 40.responsiveHeight(context),
              //         width: 270.responsiveWidth(context),
              //         color: context.read<GlobalCubit>().isDark
              //             ? AppColors.white
              //             : AppColors.black,
              //         fit: BoxFit.fill,
              //       ),
              //     );
              //   },
              // ),

              // BlocBuilder<MushafCubit, MushafState>(
              //   builder: (context, state) {
              //     final mushafCubit = context.read<MushafCubit>();
              //     return Text.rich(
              //       textDirection: TextDirection.rtl,
              //       textAlign: TextAlign.center,
              //       TextSpan(
              //         style: Styles.style18SemiBold(context).copyWith(
              //           color: AppColors.white,
              //         ),
              //         children: List.generate(
              //           globalCubit.readingPageAyahs.length,
              //           (index) {
              //             return globalCubit.readingPageAyahs[index]
              //                             .numberInSurah !=
              //                         1 ||
              //                     globalCubit.readingPageAyahs[index] ==
              //                         globalCubit.readingPageAyahs[0]
              //                 ? TextSpan(
              //                     children: [
              //                       TextSpan(
              //                         text: (globalCubit.readingPageAyahs[index]
              //                                         .numberInSurah ==
              //                                     1 &&
              //                                 (globalCubit
              //                                             .readingPageAyahs[
              //                                                 index]
              //                                             .page !=
              //                                         1 &&
              //                                     index != 1))
              //                             ? "${globalCubit.surModel!.sur[globalCubit.surahNumber - 1].name} \n\n بسم الله الرحمن الرحيم \n"
              //                             : globalCubit.surahNumber == 0 &&
              //                                     globalCubit
              //                                             .readingPageAyahs[
              //                                                 index]
              //                                             .numberInSurah ==
              //                                         1
              //                                 ? "${globalCubit.surModel!.sur[globalCubit.surahNumber].name}\n\n"
              //                                 : null,
              //                       ),
              //                       TextSpan(
              //                         text:
              //                             "${globalCubit.readingPageAyahs[index].text} (${globalCubit.readingPageAyahs[index].numberInSurah}) ",
              //                         style: Styles.style18SemiBold(context)
              //                             .copyWith(
              //                           backgroundColor:
              //                               mushafCubit.focusedAyahNumber ==
              //                                       index
              //                                   ? AppColors.lightBlue
              //                                       .withOpacity(0.4)
              //                                   : AppColors.transparent,
              //                         ),
              //                         recognizer: LongPressGestureRecognizer()
              //                           ..onLongPress = () {
              //                             mushafCubit.changeFocusedAyah(index);
              //                           },
              //                       ),
              //                     ],
              //                   )
              //                 : TextSpan(
              //                     children: [
              //                       TextSpan(
              //                           text:
              //                               "\n\n${globalCubit.surModel!.sur[globalCubit.surahNumber - 1].name} \n\n بسم الله الرحمن الرحيم \n"),
              //                       TextSpan(
              //                         text:
              //                             "${globalCubit.readingPageAyahs[index].text} (${globalCubit.readingPageAyahs[index].numberInSurah}) ",
              //                         style: Styles.style18SemiBold(context)
              //                             .copyWith(
              //                           backgroundColor:
              //                               mushafCubit.focusedAyahNumber ==
              //                                       index
              //                                   ? AppColors.lightBlue
              //                                       .withOpacity(0.4)
              //                                   : AppColors.transparent,
              //                         ),
              //                         recognizer: LongPressGestureRecognizer()
              //                           ..onLongPress = () {
              //                             mushafCubit.changeFocusedAyah(index);
              //                           },
              //                       )
              //                     ],
              //                   );
              //           },
              //         ),
              //       ),
              //     );
              //   },
              // ),

              BlocBuilder<MushafCubit, MushafState>(
                builder: (context, state) {
                  final mushafCubit = context.read<MushafCubit>();
                  return Column(
                    children: List.generate(
                      globalCubit.readingPageAyahs.length,
                      (index1) {
                        return Text.rich(
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                          TextSpan(
                            style: Styles.style18SemiBold(context).copyWith(
                              color: AppColors.white,
                            ),
                            children: List.generate(
                              globalCubit.readingPageAyahs[index1].length,
                              (index2) {
                                return TextSpan(
                                  children: [
                                    if (globalCubit
                                            .readingPageAyahs[index1][index2]
                                            .numberInSurah ==
                                        1)
                                      TextSpan(
                                        text: "\n"
                                            "${globalCubit.surModel!.sur[(globalCubit.surahNumber - 1 + index1)].name}\n"
                                            "\n بسم الله الرحمن الرحيم \n",
                                      ),
                                    TextSpan(
                                      text:
                                          "${globalCubit.readingPageAyahs[index1][index2].text}"
                                          "(${globalCubit.readingPageAyahs[index1][index2].numberInSurah}) ",
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
