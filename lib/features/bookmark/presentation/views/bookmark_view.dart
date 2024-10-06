import 'package:iu_mushaf/core/imports/imports.dart';
import 'package:iu_mushaf/core/widgets/custom_app_bar.dart';

import '../widgets/bookmarks_body.dart';

class BookmarkView extends StatelessWidget {
  const BookmarkView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: AppStrings.bookmark),
      body: const CustomGradientBody(
        body: BookmarksBody(),
      ),
    );
  }
}

