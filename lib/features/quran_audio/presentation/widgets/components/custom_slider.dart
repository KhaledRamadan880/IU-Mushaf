import 'package:iu_mushaf/core/imports/imports.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranAudioCubit, QuranAudioState>(
      builder: (context, state) {
        final cubit = context.read<QuranAudioCubit>();
        return StreamBuilder<Duration>(
          stream: cubit.audioPlayer.positionStream,
          builder: (context, snapshot) {
            final position = snapshot.data ?? Duration.zero;
            final duration = cubit.audioPlayer.duration ?? Duration.zero;
            final maxPosition =
                duration.inSeconds > 0 ? duration.inSeconds.toDouble() : 1.0;
            return TweenAnimationBuilder(
              duration: const Duration(milliseconds: 1000),
              tween: Tween<double>(
                begin: position.inSeconds.toDouble(),
                end: position.inSeconds.toDouble(),
              ),
              curve: Curves.easeInOut,
              builder: (context, animatedValue, child) {
                return SliderTheme(
                  data: SliderThemeData(
                    thumbShape: SliderComponentShape.noThumb,
                    overlayShape: SliderComponentShape.noOverlay,
                  ),
                  child: BlocBuilder<GlobalCubit, GlobalState>(
                    builder: (context, state) {
                      final bool isDark = context.read<GlobalCubit>().isDark;
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.responsiveWidth(context)),
                        child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: Slider(
                            value: animatedValue.clamp(0.0, maxPosition),
                            max: maxPosition,
                            onChanged: (value) {
                              cubit.audioPlayerSeek(value);
                            },
                            activeColor:
                                isDark ? AppColors.white : AppColors.black,
                            inactiveColor: isDark
                                ? AppColors.white.withOpacity(.4)
                                : AppColors.black.withOpacity(.4),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
