import 'package:flutter_svg/flutter_svg.dart';
import 'package:iu_mushaf/core/imports/imports.dart';

customNavBarItem(String image) {
  return PersistentBottomNavBarItem(
    icon: BlocBuilder<GlobalCubit, GlobalState>(
      builder: (context, state) {
        return SvgPicture.asset(
          image,
          colorFilter: ColorFilter.mode(
            context.read<GlobalCubit>().isDark
                ? AppColors.white
                : AppColors.black,
            BlendMode.srcIn,
          ),
        );
      },
    ),
    inactiveIcon: SvgPicture.asset(
      image,
      colorFilter: const ColorFilter.mode(AppColors.lightGrey, BlendMode.srcIn),
    ),
  );
}
