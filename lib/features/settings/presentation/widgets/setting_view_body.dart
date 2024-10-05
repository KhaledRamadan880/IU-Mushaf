import 'package:iu_mushaf/core/imports/imports.dart';
import 'package:iu_mushaf/features/settings/presentation/widgets/components/dark_mode_switch.dart';
import 'package:iu_mushaf/features/settings/presentation/widgets/components/push_notification_switch.dart';
import 'package:iu_mushaf/features/settings/presentation/widgets/custom_list_tile.dart';
import 'package:iu_mushaf/features/splash/presentation/views/splash_view.dart';

class SettingViewBody extends StatelessWidget {
  const SettingViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCubit, GlobalState>(
      builder: (context, state) {
        final cubit = context.read<GlobalCubit>();
        return Container(
          width: 357.responsiveWidth(context),
          height: 628.responsiveHeight(context),
          padding: EdgeInsets.symmetric(
            vertical: 28.responsiveHeight(context),
            horizontal: 18.responsiveWidth(context),
          ),
          margin: EdgeInsets.only(top: 12.responsiveHeight(context)),
          decoration: BoxDecoration(
            color: Theme.of(context).secondaryHeaderColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //! Prefrance Settings
              Text(
                AppStrings.prefranceSettings.tr(context),
                style: Styles.style18(context).copyWith(
                  color: AppColors.grey,
                ),
              ),
              SizedBox(height: 32.responsiveHeight(context)),
              //* Push Notification
              const CustomListTile(
                title: AppStrings.pushNotifications,
                trailing: PushNotificationSwitch(),
              ),
              //* Dark Mode
              const CustomListTile(
                title: AppStrings.darkMode,
                trailing: DarkModeSwitch(),
              ),
              //* Change Language
              CustomListTile(
                title: AppStrings.changeLanguage,
                onTap: () {
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: const SplashView(
                      showButtons: true,
                      showPopButton: true,
                    ),
                    withNavBar: false,
                  ).whenComplete(
                    () {
                      cubit.navBarController.jumpToTab(3);
                    },
                  );
                },
              ),

              //! Divider
              Divider(
                color: AppColors.grey,
                height: 15.responsiveHeight(context),
              ),
              SizedBox(height: 18.responsiveHeight(context)),

              //! More
              Text(
                AppStrings.more.tr(context),
                style: Styles.style18(context).copyWith(
                  color: AppColors.grey,
                ),
              ),
              SizedBox(height: 32.responsiveHeight(context)),
              //* About Us
              CustomListTile(
                title: AppStrings.aboutUs,
                onTap: () {},
              ),
              //* Privacy Policy
              CustomListTile(
                title: AppStrings.privacyPolicy,
                onTap: () {},
              ),
              //* Terms and Conditions
              CustomListTile(
                title: AppStrings.termsAndConditions,
                onTap: () {},
              ),
              //* Contact Us
              CustomListTile(
                title: AppStrings.contactUs,
                onTap: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}
