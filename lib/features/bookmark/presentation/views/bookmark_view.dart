import 'package:iu_mushaf/core/imports/imports.dart';
import 'package:iu_mushaf/core/widgets/custom_app_bar.dart';

import '../widgets/bookmark_card.dart';

class BookmarkView extends StatelessWidget {
  const BookmarkView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: AppStrings.bookmark),
      body: CustomGradientBody(
        body: Column(
          children: [
            //! Bookmarks Litview
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                padding: EdgeInsets.symmetric(
                  vertical: 40.responsiveHeight(context),
                ),
                itemBuilder: (context, index) {
                  return const BookmarkCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

