import 'package:iu_mushaf/core/imports/imports.dart';

import 'surah_number_container.dart';
import 'package:loading_indicator/loading_indicator.dart';

class QuranAudioSurahCard extends StatelessWidget {
  const QuranAudioSurahCard(
    this.index, {
    super.key,
    required this.title,
    required this.onTap,
  });

  final int index;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranAudioCubit, QuranAudioState>(
      builder: (context, state) {
        final cubit = context.read<QuranAudioCubit>();
        return GestureDetector(
          onTap: onTap,
          child: Container(
            height: 62.responsiveHeight(context),
            width: 343.responsiveWidth(context),
            color: AppColors.transparent,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                //! Surah Number
                SurahNumberContainer(index),
                SizedBox(width: 23.responsiveWidth(context)),
                //! Surah Name
                CustomText(
                  title,
                  style: Styles.style16(context),
                ),
                const Spacer(),
                //! Playing Loading Indicator
                cubit.selectedSurahNumber == index + 1
                    ? Container(
                        height: 20.responsiveHeight(context),
                        margin: EdgeInsets.symmetric(
                            horizontal: 10.responsiveWidth(context)),
                        child: LoadingIndicator(
                          indicatorType: Indicator.lineScalePulseOutRapid,
                          colors: [
                            context.read<GlobalCubit>().isDark
                                ? AppColors.white
                                : AppColors.black
                          ],
                          pause: cubit.audioPlayer.playing ||
                                  state is AudioIdleState
                              ? false
                              : true,
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        );
      },
    );
  }
}
