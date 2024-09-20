import 'package:iu_mushaf/core/imports/imports.dart';
import 'package:iu_mushaf/core/responsive/responsive.dart';
import 'package:iu_mushaf/core/utils/app_colors.dart';

abstract class CustomTextStyles {
  static TextStyle style(context) {
    return TextStyle(
      color: AppColors.black,
      fontSize: 18.responsiveText(context),
      overflow: TextOverflow.ellipsis,
    );
  }
}
