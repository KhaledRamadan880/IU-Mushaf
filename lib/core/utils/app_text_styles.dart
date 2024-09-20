import 'package:iu_mushaf/core/imports/imports.dart';

abstract class Styles {
  static TextStyle style28Bold(context) {
    return TextStyle(
      color: AppColors.black,
      fontSize: 28.responsiveText(context),
      overflow: TextOverflow.ellipsis,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle style18(context) {
    return TextStyle(
      color: AppColors.black,
      fontSize: 18.responsiveText(context),
      overflow: TextOverflow.ellipsis,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle style18SemiBold(context) {
    return TextStyle(
      color: AppColors.black,
      fontSize: 18.responsiveText(context),
      overflow: TextOverflow.ellipsis,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w600,
    );
  }
}
