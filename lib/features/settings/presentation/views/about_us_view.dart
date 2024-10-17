import 'package:iu_mushaf/core/imports/imports.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: AppStrings.aboutUs, showPop: true),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 24.responsiveHeight(context),
          horizontal: 16.responsiveWidth(context),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //! Use This for Title
            CustomText(
              "Title",
              style: Styles.style18SemiBold(context),
            ),
            SizedBox(height: 8.responsiveHeight(context)),
            //! Use This for Content
            CustomText(
              "Content",
              style: Styles.style18(context),
            ),
          ],
        ),
      ),
    );
  }
}
