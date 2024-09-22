import 'package:iu_mushaf/core/imports/imports.dart';

import 'surah_number_container.dart';

class QuranAudioSurahCard extends StatelessWidget {
  const QuranAudioSurahCard(this.index, {super.key});

  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62.responsiveHeight(context),
      child: Row(
        children: [
          SurahNumberContainer(index),
          SizedBox(width: 23.responsiveWidth(context)),
          CustomText(
            "Al-Fatiah",
            style: Styles.style16(context),
          ),
        ],
      ),
    );
  }
}
