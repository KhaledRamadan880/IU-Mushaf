import 'package:iu_mushaf/core/imports/imports.dart';

import 'quran_audio_surah_card.dart';

class QuranAudioSurahListView extends StatelessWidget {
  const QuranAudioSurahListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.responsiveHeight(context),
      child: ListView.separated(
        itemCount: 10,
        padding: EdgeInsets.symmetric(vertical: 12.responsiveHeight(context)),
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemBuilder: (context, index) {
          return QuranAudioSurahCard(index);
        },
      ),
    );
  }
}
