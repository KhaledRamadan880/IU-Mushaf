import 'package:flutter_svg/flutter_svg.dart';
import 'package:iu_mushaf/core/imports/imports.dart';

class QuranAudioPlayer extends StatelessWidget {
  const QuranAudioPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCubit, GlobalState>(
      builder: (context, state) {
        final bool isDark = context.read<GlobalCubit>().isDark;
        return Column(
          children: [
            SizedBox(height: 24.responsiveHeight(context)),
            //! Sourah Name And Qari
            Text(
              "Surah Al-Baqarah - *Qari Name*",
              style: Styles.style18SemiBold(context).copyWith(
                color: AppColors.green,
              ),
            ),
            //! Progress Indicator
            Slider(
              value: .3,
              max: 1,
              onChanged: (value) {},
              activeColor: isDark ? AppColors.white : AppColors.black,
              inactiveColor: AppColors.grey,
            ),
            //! timing
            Row(
              children: [
                SizedBox(width: 20.responsiveWidth(context)),
                //! Current Time
                CustomText(
                  "13:00",
                  style: Styles.style12(context),
                ),
                const Spacer(),
                //! Total Time
                CustomText(
                  "13:00",
                  style: Styles.style12(context),
                ),
                SizedBox(width: 20.responsiveWidth(context)),
              ],
            ),
            //! Controllers
            SizedBox(
              height: 64.responsiveHeight(context),
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //! Skip Previous Button
                      Icon(
                        Icons.skip_previous,
                        size: 48.responsiveHeight(context),
                        color: isDark ? AppColors.white : AppColors.black,
                      ),
                      //! Play & Pause Button
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.responsiveWidth(context)),
                        child: CircleAvatar(
                          radius: 32.responsiveHeight(context),
                          backgroundColor:
                              isDark ? AppColors.white : AppColors.black,
                          child: Icon(
                            Icons.play_arrow,
                            color: !isDark ? AppColors.white : AppColors.black,
                            size: 38.responsiveHeight(context),
                          ),
                        ),
                      ),
                      //! Skip Next Button
                      Icon(
                        Icons.skip_next,
                        size: 48.responsiveHeight(context),
                        color: isDark ? AppColors.white : AppColors.black,
                      ),
                    ],
                  ),
                  //! Setting Button
                  Align(
                    alignment: Alignment.centerRight,
                    child: SvgPicture.asset(
                      Assets.imagesSettingsIcon,
                      colorFilter: const ColorFilter.mode(
                        AppColors.grey,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
