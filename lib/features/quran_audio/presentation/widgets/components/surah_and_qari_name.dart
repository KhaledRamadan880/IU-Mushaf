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
                                "${cubit.surModel!.sur[snapshot.data!.currentIndex].englishName}"
                                " - ${cubit.surReadersAudiosModel!.surReadersAudios[0].readerNameEnglish}"
                            : "${cubit.surModel!.sur[snapshot.data!.currentIndex].name}"
                                " - ${cubit.surReadersAudiosModel!.surReadersAudios[0].readerNameArabic}",
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
