import 'package:flutter/services.dart';
import 'package:iu_mushaf/core/imports/imports.dart';
import 'package:iu_mushaf/core/local/localization_settings.dart';
import 'package:iu_mushaf/core/theme/theme.dart';
import 'package:iu_mushaf/features/splash/presentation/views/splash_view.dart';

class UIMushafApp extends StatelessWidget {
  const UIMushafApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return BlocBuilder<GlobalCubit, GlobalState>(
      builder: (context, state) {
        return MaterialApp(
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaler: TextScaler.noScaling),
              child: child!,
            );
          },
          debugShowCheckedModeBanner: false,
          //!Localization Settings
          localizationsDelegates: localizationsDelegatesList,
          supportedLocales: supportedLocalesList,
          locale: Locale(context.read<GlobalCubit>().language),
          //! Theme
          theme:
              context.read<GlobalCubit>().isDark ? darkTheme() : lightTheme(),
          //! Home
          home: const SplashView(),
        );
      },
    );
  }
}
