import 'package:iu_mushaf/core/imports/imports.dart';

class SurahAndQariName extends StatelessWidget {
  const SurahAndQariName({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranAudioCubit, QuranAudioState>(
      builder: (context, state) {
        final cubit = context.read<QuranAudioCubit>();
        return StreamBuilder(
            stream: cubit.audioPlayer.sequenceStateStream,
            builder: (context, snapshot) {
              return BlocBuilder<GlobalCubit, GlobalState>(
                builder: (context, state) {
                  return Text(                         
                    snapshot.data?.currentSource == null
                        ? ""
                        : context.read<GlobalCubit>().language == "en"
                            ? "${AppStrings.surah.tr(context)} "
                                "${cubit.surahsModel!.surahs[snapshot.data!.currentIndex].englishName}"
                                " - ${cubit.surrecitersAudiosModel!.surrecitersAudios[cubit.selectedReciter].reciterNameEnglish}"
                            : "${cubit.surahsModel!.surahs[snapshot.data!.currentIndex].name}"
                                " - ${cubit.surrecitersAudiosModel!.surrecitersAudios[cubit.selectedReciter].reciterNameArabic}",
                    style: Styles.style18SemiBold(context).copyWith(
                      color: context.read<GlobalCubit>().isDark
                          ? AppColors.white
                          : AppColors.green,
                    ),
                  );
                },
              );
            }
        );
      },
    );
  }
}
