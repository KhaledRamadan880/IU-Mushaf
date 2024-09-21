import 'dart:ui';

import 'package:iu_mushaf/core/imports/imports.dart';

class CustomGradientBody extends StatelessWidget {
  const CustomGradientBody({
    super.key,
    required this.body,
  });
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //! Gradiant Color
        Positioned(
          top: 664.responsiveHeight(context),
          left: -68.responsiveWidth(context),
          child: SizedBox(
            width: 717.responsiveWidth(context),
            height: 269.responsiveHeight(context),
            child: CustomPaint(
              painter: EllipsePainter(context: context),
            ),
          ),
        ),
        //! Body
        SizedBox(
          height: 852.responsiveHeight(context),
          width: 393.responsiveWidth(context),
          child: body,
        ),
      ],
    );
  }
}

class EllipsePainter extends CustomPainter {
  EllipsePainter({super.repaint, required this.context});

  final BuildContext context;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Theme.of(context).primaryColor.withOpacity(.7)
      ..style = PaintingStyle.fill
      ..imageFilter = ImageFilter.blur(sigmaX: 200, sigmaY: 50);
    Rect rect = Rect.fromLTWH(
        0, 0, 717.responsiveText(context), 269.responsiveHeight(context));

    canvas.drawOval(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
