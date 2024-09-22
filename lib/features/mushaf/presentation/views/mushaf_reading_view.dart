import 'package:iu_mushaf/core/imports/imports.dart';

import '../widgets/mushaf_reading_container.dart';
import '../widgets/mushaf_reading_header.dart';
import '../widgets/mushaf_reading_page_and_surah.dart';

class MushafReadingView extends StatelessWidget {
  const MushafReadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 37.responsiveHeight(context)),
          //! Header Bar
          const MushafReadingHeader(),
          //! Reading Container
          const MushafReadingContainer(),
          //! Page Number & Surah Name
          const MushafReadingPageNumberAndSurah(),
        ],
      ),
    );
  }
}
