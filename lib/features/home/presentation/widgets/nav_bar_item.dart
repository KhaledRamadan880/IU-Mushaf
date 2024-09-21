import 'package:flutter_svg/flutter_svg.dart';
import 'package:iu_mushaf/core/imports/imports.dart';

customNavBarItem(String image) {
  return PersistentBottomNavBarItem(
    icon: SvgPicture.asset(
      image,
      colorFilter: const ColorFilter.mode(AppColors.black, BlendMode.srcIn),
    ),
    inactiveIcon: SvgPicture.asset(
      image,
      colorFilter: const ColorFilter.mode(AppColors.lightGrey, BlendMode.srcIn),
    ),
  );
}
