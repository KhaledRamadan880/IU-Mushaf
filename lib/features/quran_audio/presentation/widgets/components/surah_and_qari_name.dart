import 'package:iu_mushaf/core/imports/imports.dart';

class SurahAndQariName extends StatelessWidget {
  const SurahAndQariName({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranAudioCubit, QuranAudioState>(
      builder: (context, state) {
        final cubit = context.read<QuranAudioCubit>();
        return BlocBuilder<GlobalCubit, GlobalState>(
          builder: (context, state) {
            return Text(
              cubit.selectedSurahNumber != 0
                  ? context.read<GlobalCubit>().language == "en"
                      ? "${AppStrings.surah.tr(context)} "
                          "${context.read<GlobalCubit>().surModel!.sur[cubit.selectedSurahNumber - 1].englishName}"
                          " - ${context.read<GlobalCubit>().surReadersAudiosModel!.surReadersAudios[0].readerNameEnglish}"
                      : "${context.read<GlobalCubit>().surModel!.sur[cubit.selectedSurahNumber - 1].name}"
                          " - ${context.read<GlobalCubit>().surReadersAudiosModel!.surReadersAudios[0].readerNameArabic}"
                  : "",
              style: Styles.style18SemiBold(context).copyWith(
                color: context.read<GlobalCubit>().isDark
                    ? AppColors.white
                    : AppColors.green,
              ),
            );
          },
        );
      },
    );
  }
}
