import 'package:device_preview/device_preview.dart';
import 'package:iu_mushaf/app/app.dart';
import 'package:iu_mushaf/core/imports/imports.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initServiceLocator();
  await sl<Cache>().init();
  await sl<MediaPlayer>().inital();
  runApp(
    DevicePreview(
      // enabled: !kReleaseMode,
      enabled: false,
      builder: (context) => BlocProvider(
        create: (context) => GlobalCubit()
          ..loadMushafFromJson()
          ..loadSurAudiosFromJson()
          ..loadAyahsFromJson()
          ..loadTafsersFromJson()
          ..getBookmarks(),
        child: const UIMushafApp(),
      ),
    ),
  );
}
