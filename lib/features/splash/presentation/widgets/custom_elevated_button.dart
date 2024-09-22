import 'package:iu_mushaf/core/imports/imports.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.title, this.textColor,
  });

  final Function() onPressed;
  final String title;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        fixedSize: Size(
          185.responsiveWidth(context),
          60.responsiveHeight(context),
        ),
      ),
      child: Text(
        title,
        style: Styles.style18SemiBold(context)
            .copyWith(color: textColor ?? AppColors.black),
      ),
    );
  }
}
