import 'package:iu_mushaf/core/imports/imports.dart';
import 'package:iu_mushaf/features/home/presentation/widgets/nav_bar_item.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key, required this.screens});

  final List<Widget> screens;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCubit, GlobalState>(
      builder: (context, state) {
        return PersistentTabView(
          context,
          controller: context.read<GlobalCubit>().navBarController,
          isVisible: context.read<GlobalCubit>().isNavBarVisible,
          navBarStyle: NavBarStyle.style6,
          navBarHeight: 64.responsiveHeight(context),
          screens: screens,
          items: [
            customNavBarItem(Assets.imagesMushafIcon),
            customNavBarItem(Assets.imagesRecoedIcon),
            customNavBarItem(Assets.imagesSaveIcon),
            customNavBarItem(Assets.imagesSettingsIcon),
          ],
          backgroundColor: Theme.of(context).secondaryHeaderColor,
          margin: EdgeInsets.symmetric(
            horizontal: 24.responsiveWidth(context),
            vertical: context.read<GlobalCubit>().isNavBarVisible
                ? 32.responsiveHeight(context)
                : 0,
          ),
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.2),
                blurRadius: 2,
              ),
            ],
          ),
          animationSettings: const NavBarAnimationSettings(
            navBarItemAnimation: ItemAnimationSettings(
              duration: Duration(microseconds: 0),
            ),
          ),
        );
      },
    );
  }
}
