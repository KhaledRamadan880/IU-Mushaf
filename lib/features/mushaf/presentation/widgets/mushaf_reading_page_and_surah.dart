import 'package:iu_mushaf/core/imports/imports.dart';

class MushafReadingPageNumberAndSurah extends StatelessWidget {
  const MushafReadingPageNumberAndSurah({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 36.responsiveWidth(context)),
      child: Row(
        children: [
          CustomText(
            "${AppStrings.page.tr(context)} 312",
            style: Styles.style16(context),
          ),
          const Spacer(),
          CustomText(
            "${AppStrings.surah.tr(context)} Taahaa",
            style: Styles.style16(context),
          ),
        ],
      ),
    );
  }
}
