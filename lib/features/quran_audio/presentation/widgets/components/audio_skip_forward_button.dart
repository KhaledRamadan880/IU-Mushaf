import 'package:iu_mushaf/core/imports/imports.dart';

class AudioSkipForwardButton extends StatelessWidget {
  const AudioSkipForwardButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranAudioCubit, QuranAudioState>(
      builder: (context, state) {
        final cubit = context.read<QuranAudioCubit>();
        return GestureDetector(
          onTap: () {
            if (cubit.selectedSurahNumber != 0 &&
                cubit.selectedSurahNumber != 114) {
              cubit.audioPlayerSkipFroward(
                context,
                context.read<GlobalCubit>().surReadersAudiosModel!,
              );
            }
          },
          child: BlocBuilder<GlobalCubit, GlobalState>(
            builder: (context, state) {
              final isDark = context.read<GlobalCubit>().isDark;
              return Icon(
                Icons.skip_next_rounded,
                size: 48.responsiveHeight(context),
                color: cubit.selectedSurahNumber != 0 &&
                        cubit.selectedSurahNumber != 114
                    ? isDark
                        ? AppColors.white
                        : AppColors.black
                    : isDark
                        ? AppColors.white.withOpacity(.4)
                        : AppColors.black.withOpacity(.4),
              );
            },
          ),
        );
      },
    );
  }
}
