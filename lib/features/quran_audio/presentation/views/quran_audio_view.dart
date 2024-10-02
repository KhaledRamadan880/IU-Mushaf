import 'package:iu_mushaf/core/imports/imports.dart';
import 'package:iu_mushaf/core/widgets/custom_app_bar.dart';
import 'package:iu_mushaf/features/quran_audio/presentation/widgets/quran_audio_player.dart';
import 'package:iu_mushaf/features/quran_audio/presentation/widgets/quran_audio_surah_listview.dart';

import '../widgets/quran_audio_search_button.dart';
import '../widgets/quran_audio_title_and_divider.dart';

class QuranAudioView extends StatelessWidget {
  const QuranAudioView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        title: AppStrings.quranAudio,
        icon: const QuranAudioSearchButton(),
      ),
      body: CustomGradientBody(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.responsiveWidth(context),
          ),
          child: BlocBuilder<QuranAudioCubit, QuranAudioState>(
            builder: (context, state) {
              return const Column(
                children: [
                  //! Title & Divider
                  QuranAudioTitleAndDivider(),
                  //! Surah List View
                  QuranAudioSurahListView(),
                  //! Audio Player
                  QuranAudioPlayer(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
