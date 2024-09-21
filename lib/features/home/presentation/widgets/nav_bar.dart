import 'package:iu_mushaf/core/imports/imports.dart';
import 'package:iu_mushaf/features/home/presentation/widgets/nav_bar_item.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key, required this.screens});

  final List<Widget> screens;

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      navBarStyle: NavBarStyle.style6,
      navBarHeight: 64.responsiveHeight(context),
      screens: screens,
      items: [
        customNavBarItem(Assets.imagesMushafIcon),
        customNavBarItem(Assets.imagesRecoedIcon),
        customNavBarItem(Assets.imagesSaveIcon),
        customNavBarItem(Assets.imagesSettingsIcon),
      ],
      backgroundColor: AppColors.white,
      margin: EdgeInsets.symmetric(
        horizontal: 24.responsiveWidth(context),
        vertical: 32.responsiveHeight(context),
      ),
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(40),
      ),
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(microseconds: 1000),
        ),
      ),
    );
  }
}
