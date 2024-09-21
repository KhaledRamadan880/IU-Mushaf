import 'package:iu_mushaf/core/imports/imports.dart';

class SettingViewHeader extends StatelessWidget {
  const SettingViewHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 393.responsiveWidth(context),
      height: 101.responsiveHeight(context),
      padding: EdgeInsets.only(
        top: 53.responsiveHeight(context),
      ),
      margin: EdgeInsets.only(
        bottom: 12.responsiveHeight(context),
      ),
      color: Theme.of(context).secondaryHeaderColor,
      child: Center(
        child: Text(
          AppStrings.setting.tr(context),
          style: Styles.style18SemiBold(context),
        ),
      ),
    );
  }
}
