import 'package:iu_mushaf/core/imports/imports.dart';
import 'package:iu_mushaf/features/mushaf/presentation/widgets/mushaf_cards_list_view.dart';

class MushafView extends StatelessWidget {
  const MushafView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomGradientBody(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 18.responsiveWidth(context),
            vertical: 41.responsiveHeight(context),
          ),
          child: Column(
            children: [
              //! Title
              Row(
                children: [
                  CustomText(
                    AppStrings.iuMushaf.tr(context),
                    style: Styles.style28Bold(context),
                  ),
                ],
              ),
              //! Cards List View
              const MushafCardsListView(),
            ],
          ),
        ),
      ),
    );
  }
}
