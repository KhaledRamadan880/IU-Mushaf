import 'package:flutter/material.dart';

const num uiWidth = 374;
const num uiHeight = 852;

extension ResponsiveUI on num {
  responsiveWidth(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return MediaQuery.of(context).size.width * (this / uiWidth);
    } else {
      return MediaQuery.of(context).size.width * (this / uiHeight);
    }
  }

  responsiveHeight(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return MediaQuery.of(context).size.height * (this / uiHeight);
    } else {
      return MediaQuery.of(context).size.height * (this / uiWidth);
    }
  }

  responsiveText(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return MediaQuery.of(context).size.height * (this / uiHeight);
    } else {
      return MediaQuery.of(context).size.height * (this / uiWidth);
    }
  }
}
