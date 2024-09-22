import 'package:iu_mushaf/core/imports/imports.dart';

abstract class Styles {      

  static TextStyle style28Bold(context) {
    return TextStyle(
      color: sl<GlobalCubit>().isDark ? AppColors.white : AppColors.black,
      fontSize: 28.responsiveText(context),
      overflow: TextOverflow.ellipsis,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle style18(context) {
    return TextStyle(
      color: sl<GlobalCubit>().isDark ? AppColors.white : AppColors.black,
      fontSize: 18.responsiveText(context),
      overflow: TextOverflow.ellipsis,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle style18SemiBold(context) {
    return TextStyle(
      color: sl<GlobalCubit>().isDark ? AppColors.white : AppColors.black,
      fontSize: 18.responsiveText(context),
      overflow: TextOverflow.ellipsis,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle style16SemiBold(context) {
    return TextStyle(
      color: sl<GlobalCubit>().isDark ? AppColors.white : AppColors.black,
      fontSize: 16.responsiveText(context),
      overflow: TextOverflow.ellipsis,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle style16(context) {
    return TextStyle(
      color: sl<GlobalCubit>().isDark ? AppColors.white : AppColors.black,
      fontSize: 16.responsiveText(context),
      overflow: TextOverflow.ellipsis,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle style14(context) {
    return TextStyle(
      color: sl<GlobalCubit>().isDark ? AppColors.white : AppColors.black,
      fontSize: 14.responsiveText(context),
      overflow: TextOverflow.ellipsis,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle style14Medium(context) {
    return TextStyle(
      color: sl<GlobalCubit>().isDark ? AppColors.white : AppColors.black,
      fontSize: 14.responsiveText(context),
      overflow: TextOverflow.ellipsis,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle style12(context) {
    return TextStyle(
      color: sl<GlobalCubit>().isDark ? AppColors.white : AppColors.black,
      fontSize: 12.responsiveText(context),
      overflow: TextOverflow.ellipsis,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w400,
    );
  }
}
