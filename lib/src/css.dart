import 'package:flutter/material.dart';

class CSS {
  double fontSize;
  double lineHeightScale;
  bool isItalic;
  bool isBold;
  bool deleted;
  bool underline;
  Color fontColor;
  Color backgroundColor;

  CSS({
    this.fontSize,
    this.lineHeightScale,
    this.isItalic,
    this.isBold,
    this.fontColor,
    this.backgroundColor,
    this.deleted,
    this.underline,
  }) {
    fontSize ??= 11;
    lineHeightScale ??= 1;
    isItalic ??= false;
    isBold ??= false;
    fontColor ??= Colors.black87;
    backgroundColor ??= Colors.transparent;
    deleted ??= false;
    underline ??= false;
  }

  static CSS copyFrom(CSS css) {
    return CSS(
      fontSize: css.fontSize,
      isItalic: css.isItalic,
      isBold: css.isBold,
      fontColor: css.fontColor,
      backgroundColor: css.backgroundColor,
      deleted: css.deleted,
      underline: css.underline,
    );
  }

  TextStyle castStyle() {
    return TextStyle(
      fontSize: fontSize,
      height: lineHeightScale,
      color: fontColor,
      fontStyle: (isItalic) ? FontStyle.italic : FontStyle.normal,
      fontWeight: (isBold) ? FontWeight.bold : FontWeight.normal,
      decoration: TextDecoration.combine([
        deleted ? TextDecoration.lineThrough : TextDecoration.none,
        underline ? TextDecoration.underline : TextDecoration.none,
      ]),
      backgroundColor: backgroundColor,
    );
  }
}
