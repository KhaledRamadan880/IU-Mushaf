import 'package:iu_mushaf/core/imports/imports.dart';

AppBar customAppBar(
  BuildContext context, {
  required String title,
  Widget? icon,
}) {
  return AppBar(
    title: CustomText(
      title.tr(context),
      style: Styles.style18SemiBold(context),
    ),
    centerTitle: true,
    actions: [
      icon ?? Container(),
      SizedBox(
          width: 20.responsiveWidth(context)
      ),
    ],
    backgroundColor: Theme.of(context).secondaryHeaderColor,
    toolbarHeight: 62.responsiveHeight(context),
    surfaceTintColor: AppColors.transparent,
  );
}
