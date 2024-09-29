import 'package:iu_mushaf/core/imports/imports.dart';
import 'package:iu_mushaf/features/mushaf/presentation/cubit/mushaf_cubit.dart';

class MushafReadingPageNumberAndSurah extends StatelessWidget {
  const MushafReadingPageNumberAndSurah({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCubit, GlobalState>(
      builder: (context, state) {
        final cubit = context.read<GlobalCubit>();
        return BlocBuilder<MushafCubit, MushafState>(
          builder: (context, state) {
            final mushafCubit = context.read<MushafCubit>();
            return AnimatedOpacity(
              duration: const Duration(milliseconds: 250),
              opacity: mushafCubit.isLayoutHiddin ? 0 : 1,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 36.responsiveWidth(context)),
                child: Row(
                  children: [
                    CustomText(
                      "${AppStrings.page.tr(context)} ${cubit.pageNumber}",
                      style: Styles.style16(context),
                    ),
                    const Spacer(),
                    CustomText(
                      // "${AppStrings.surah.tr(context)} ${cubit.surModel!.sur[cubit.surahNumber].name}",
                      "${AppStrings.surah.tr(context)} ${cubit.surModel!.sur[cubit.surahNumber-1].englishName}",
                      style: Styles.style16(context),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
