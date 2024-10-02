import 'package:iu_mushaf/core/imports/imports.dart';

class Toast extends StatelessWidget {
  final String message;

  const Toast({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: 20.responsiveWidth(context),
              vertical: 40.0.responsiveHeight(context)),
          padding: EdgeInsets.symmetric(
              horizontal: 24.responsiveWidth(context),
              vertical: 16.responsiveHeight(context)),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: CustomText(
            message,
            style: Styles.style18(context),
          ),
        ),
      ),
    );
  }
}

void showToast(BuildContext context, String message) {
  OverlayEntry overlayEntry;
  overlayEntry = OverlayEntry(
    builder: (BuildContext context) => Positioned(
      bottom: 80.responsiveHeight(context),
      left: 0,
      right: 0,
      child: Toast(message: message),
    ),
  );

  Overlay.of(context).insert(overlayEntry);

  Future.delayed(const Duration(milliseconds: 750), () {
    overlayEntry.remove();
  });
}
