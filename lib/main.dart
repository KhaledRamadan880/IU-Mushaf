import 'package:iu_mushaf/app/app.dart';
import 'package:iu_mushaf/core/imports/imports.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initServiceLocator();
  await sl<Cache>().init();
  await sl<MediaPlayer>().inital();
  runApp(
    BlocProvider(
        create: (context) => GlobalCubit()
          ..inital(),
        child: const UIMushafApp(),
      ),    
  );
}
