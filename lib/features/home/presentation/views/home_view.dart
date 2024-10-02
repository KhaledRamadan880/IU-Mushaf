import 'package:iu_mushaf/core/imports/imports.dart';
import 'package:iu_mushaf/features/bookmark/presentation/views/bookmark_view.dart';
import 'package:iu_mushaf/features/home/presentation/widgets/nav_bar.dart';
import 'package:iu_mushaf/features/mushaf/presentation/views/mushaf_view.dart';
import 'package:iu_mushaf/features/quran_audio/presentation/views/quran_audio_view.dart';
import 'package:iu_mushaf/features/settings/presentation/views/settings_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  List<Widget> screens() {
    return [
      //! Mushaf Screen
      const MushafView(),
      //! Quran Audio Screen
      BlocProvider(
        create: (context) => QuranAudioCubit(),
        child: const QuranAudioView(),
      ),
      //! Bookmark Screen
      const BookmarkView(),
      //! Setting Screen
      const SettingsView(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CustomNavBar(
      screens: screens(),
    );
  }
}
