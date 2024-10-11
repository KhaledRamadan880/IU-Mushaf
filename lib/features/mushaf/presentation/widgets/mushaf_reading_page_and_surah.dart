import 'package:iu_mushaf/core/imports/imports.dart';
import 'package:iu_mushaf/features/mushaf/data/page_data.dart';

class MushafReadingPageNumberAndSurah extends StatelessWidget {
  const MushafReadingPageNumberAndSurah({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MushafCubit, MushafState>(
          builder: (context, state) {
        final cubit = context.read<MushafCubit>();
            return AnimatedOpacity(
              duration: const Duration(milliseconds: 250),
          opacity: cubit.isLayoutHiddin ? 0 : 1,
              child: Padding(
            padding: EdgeInsets.only(
              left: 36.responsiveWidth(context),
              right: 36.responsiveWidth(context),
              top: 40.responsiveHeight(context),
            ),
                child: Row(
                  children: [
                //! Surah Name
                    CustomText(
                  context.read<GlobalCubit>().language == "en"
                      ? "${AppStrings.surah.tr(context)} ${cubit.surahsModel!.surahs[pageData[cubit.pageNumber - 1][0]["surah"] - 1].englishName}"
                      : "${AppStrings.surah.tr(context)} "
                          "${cubit.surahsModel!.surahs[pageData[cubit.pageNumber - 1][0]["surah"] - 1].name}",
                      style: Styles.style16(context),
                    ),
                    const Spacer(),
                //! Page Number
                    CustomText(
                  "${AppStrings.page.tr(context)} "
                  "${cubit.pageNumber}",
                      style: Styles.style16(context),
                    ),
                  ],
                ),
          ),
        );
      },
    );
  }
}
