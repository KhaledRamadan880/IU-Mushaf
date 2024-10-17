import 'package:flutter_svg/flutter_svg.dart';
import 'package:iu_mushaf/core/imports/imports.dart';

class MushafCard extends StatelessWidget {
  const MushafCard({
    super.key,
    required this.mushafType,
    required this.accent,
    required this.by,
    required this.onTap,
  });

  final String mushafType, accent, by;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 140.responsiveHeight(context),
        margin: EdgeInsets.only(
          bottom: 36.responsiveHeight(context),
        ),
        padding: EdgeInsets.only(
          top: 20.responsiveHeight(context),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).primaryColor.withOpacity(.8),
              Theme.of(context).primaryColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            SizedBox(width: 20.responsiveWidth(context)),
            //! Content
            SizedBox(
              width: 166.responsiveWidth(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(Assets.imagesBookIcon),
                      SizedBox(width: 8.responsiveWidth(context)),
                      Text(
                        mushafType,
                        style: Styles.style14Medium(context).copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 14.responsiveHeight(context)),
                  //! Mushaf Type
                  Text(
                    "${AppStrings.mushaf.tr(context)} $mushafType",
                    style: Styles.style18SemiBold(context).copyWith(
                      color: AppColors.black,
                    ),
                  ),
                  //! Accent
                  Text(
                    "${AppStrings.accent.tr(context)} $accent",
                    style: Styles.style14(context).copyWith(
                      color: AppColors.black,
                    ),
                  ),
                  //! By
                  Text(
                    "${AppStrings.by.tr(context)} $by",
                    style: Styles.style14(context).copyWith(
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
            //! Image
            SizedBox(
              width: 133.responsiveWidth(context),
              height: 141.responsiveHeight(context),
              child: Image.asset(
                Assets.imagesMainLogo,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(width: 7.responsiveWidth(context)),
          ],
        ),
      ),
    );
  }
}
