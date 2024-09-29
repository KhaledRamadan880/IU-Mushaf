import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:iu_mushaf/app/app.dart';
import 'package:iu_mushaf/core/imports/imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initServiceLocator();
  await sl<Cache>().init();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      // enabled: false,
      builder: (context) => BlocProvider(
        create: (context) => GlobalCubit()..loadMushafFromJson(),
        child: const UIMushafApp(),
      ),
    ),
  );
}
