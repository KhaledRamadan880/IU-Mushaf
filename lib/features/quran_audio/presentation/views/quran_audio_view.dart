import 'package:iu_mushaf/core/imports/imports.dart';
import 'package:iu_mushaf/features/quran_audio/presentation/widgets/quran_audio_player.dart';
import 'package:iu_mushaf/features/quran_audio/presentation/widgets/quran_audio_surah_listview.dart';

import '../widgets/components/search_text_field.dart';
import '../widgets/quran_audio_search_button.dart';
import '../widgets/quran_audio_title_and_divider.dart';

class QuranAudioView extends StatelessWidget {
  const QuranAudioView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: customAppBar(
        context,
        title: AppStrings.quranAudio,
        icon: const QuranAudioSearchButton(),
      ),
      body: BlocBuilder<GlobalCubit, GlobalState>(
        builder: (context, state) {
          return CustomGradientBody(
            body: BlocBuilder<QuranAudioCubit, QuranAudioState>(
              builder: (context, state) {
                return const Column(
                  children: [
                    //! Search
                    SearchTextField(),
                    //! Title & Divider
                    QuranAudioTitleAndDivider(),
                    //! Surah List View
                    QuranAudioSurahListView(),
                    //! Audio Player
                    QuranAudioPlayer()
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
