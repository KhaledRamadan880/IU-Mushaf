import 'package:iu_mushaf/core/imports/imports.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 64.responsiveWidth(context),
        height: 64.responsiveHeight(context),
        margin: EdgeInsets.symmetric(
            horizontal: 24.responsiveWidth(context)),
        padding: EdgeInsets.symmetric(
          horizontal: 10.responsiveWidth(context),
          vertical: 10.responsiveHeight(context),
        ),
        child: CircularProgressIndicator(
          color: context.read<GlobalCubit>().isDark
              ? AppColors.white
              : AppColors.black,
        ),
      );
  }
}
