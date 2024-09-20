import 'package:iu_mushaf/core/imports/imports.dart';
import 'package:iu_mushaf/features/splash/presentation/widgets/custom_elevated_button.dart';
import 'package:iu_mushaf/features/splash/presentation/widgets/splash_title_and_subtitle.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCubit, GlobalState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              //! Title & Subtitle
              const SplashTitleAndSubtitle(),
              SizedBox(height: 8.responsiveHeight(context)),
              //! Logo
              Image.asset(
                Assets.imagesMushafImage,
                height: 430.responsiveHeight(context),
                width: 374.responsiveWidth(context),
                fit: BoxFit.fill,
              ),
              const Spacer(),
              //! English Button
              CustomElevatedButton(
                onPressed: () {
                  context.read<GlobalCubit>().changeLanguage("en");
                },
                title: AppStrings.english.tr(context),
              ),
              SizedBox(height: 20.responsiveHeight(context)),
              //! Arabic Button
              CustomElevatedButton(
                onPressed: () {
                  context.read<GlobalCubit>().changeLanguage("ar");
                },
                title: AppStrings.arabic.tr(context),
              ),
              SizedBox(height: 61.responsiveHeight(context)),
            ],
          ),
        );
      },
    );
  }
}
