import 'package:iu_mushaf/core/imports/imports.dart';

class SplashTitleAndSubtitle extends StatelessWidget {
  const SplashTitleAndSubtitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.responsiveWidth(context)),
      child: Column(
        children: [          
          //! Title
          CustomText(
            AppStrings.iuMushaf.tr(context),
            style: Styles.style28Bold(context),
          ),
          SizedBox(height: 16.responsiveHeight(context)),
          //! Subtitle
          CustomText(
            AppStrings.splashSubtitle.tr(context),
            style: Styles.style18(context).copyWith(
              overflow: TextOverflow.clip,
              color: AppColors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
