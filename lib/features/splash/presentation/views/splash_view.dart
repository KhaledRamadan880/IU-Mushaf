import 'package:iu_mushaf/core/imports/imports.dart';
import 'package:iu_mushaf/features/home/presentation/views/home_view.dart';
import 'package:iu_mushaf/features/splash/presentation/widgets/custom_elevated_button.dart';
import 'package:iu_mushaf/features/splash/presentation/widgets/splash_title_and_subtitle.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key, this.showButtons = false});
  final bool? showButtons;
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool isFirstStart = false;
  late bool showButtons;

  @override
  void initState() {
    super.initState();
    showButtons = widget.showButtons!;
    if (sl<Cache>().getBoolData("IsFirstStart") != false) {
      Future.delayed(
        const Duration(seconds: 2),
        () {
          showButtons = true;
          isFirstStart = true;
          setState(() {});
        },
      );
    } else {
      showButtons
          ? null
          : Future.delayed(const Duration(seconds: 2), () => navigator(null));
    }
  }

  navigator(String? language) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeView()),
    );
    if (language != null) context.read<GlobalCubit>().changeLanguage(language);
    sl<Cache>().setData("IsFirstStart", false);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCubit, GlobalState>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            physics: const ScrollPhysics(
              parent: NeverScrollableScrollPhysics(),
            ),
            child: Column(
              children: [
                //! Title & Subtitle
                const SplashTitleAndSubtitle(),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  height: showButtons
                      ? 8.responsiveHeight(context)
                      : 80.responsiveHeight(context),
                ),
                //! Logo
                Image.asset(
                  Assets.imagesMushafImage,
                  height: 435.responsiveHeight(context),
                  width: 374.responsiveWidth(context),
                  fit: BoxFit.fill,
                ),
                SizedBox(height: 21.responsiveHeight(context)),
                //! Buttons
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 1000),
                  opacity: isFirstStart || showButtons ? 1 : 0,
                  child: showButtons
                      ? Column(
                          children: [
                            //! English Button
                            CustomElevatedButton(
                              onPressed: () {
                                navigator("en");
                              },
                              title: AppStrings.english.tr(context),
                            ),
                            SizedBox(height: 20.responsiveHeight(context)),
                            //! Arabic Button
                            CustomElevatedButton(
                              onPressed: () {
                                navigator("ar");
                              },
                              title: AppStrings.arabic.tr(context),
                            ),
                          ],
                        )
                      : Container(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
