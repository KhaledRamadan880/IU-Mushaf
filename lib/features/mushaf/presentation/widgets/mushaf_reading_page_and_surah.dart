import 'package:iu_mushaf/core/imports/imports.dart';

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
                padding: EdgeInsets.symmetric(
                    horizontal: 36.responsiveWidth(context)),
                child: Row(
                  children: [
                //! Page Number
                    CustomText(
                  "${AppStrings.page.tr(context)} "
                  "${cubit.pageNumber}",
                      style: Styles.style16(context),
                    ),
                    const Spacer(),
                //! Surah Name
                    CustomText(
                  context.read<GlobalCubit>().language == "en"
                      ? "${AppStrings.surah.tr(context)} ${cubit.surModel.sur[cubit.surahNumber - 1].englishName}"
                      : ""
                          "${cubit.surModel.sur[cubit.surahNumber - 1].name}",
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
