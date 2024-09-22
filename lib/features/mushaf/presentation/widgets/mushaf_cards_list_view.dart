import 'package:iu_mushaf/core/imports/imports.dart';
import 'package:iu_mushaf/features/mushaf/presentation/views/mushaf_reading_view.dart';
import 'package:iu_mushaf/features/mushaf/presentation/widgets/mushaf_card.dart';

class MushafCardsListView extends StatelessWidget {
  const MushafCardsListView({
    super.key,
  });

  static List mushafs = [
    {
      "mushafType": "Warch",
      "accent": "Narrated",
      "by": "Warsh",
    },
    {
      "mushafType": "Hafs",
      "accent": "Narrated",
      "by": "hafs",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: 326.responsiveWidth(context),
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return MushafCard(
              mushafType: mushafs[index]["mushafType"],
              accent: mushafs[index]["accent"],
              by: mushafs[index]["by"],
              onTap: () {
                PersistentNavBarNavigator.pushDynamicScreen(
                  context,
                  screen: MaterialPageRoute(
                    builder: (context) => const MushafReadingView(),
                  ),
                  withNavBar: false,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
