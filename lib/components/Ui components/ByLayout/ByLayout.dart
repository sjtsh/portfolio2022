import 'dart:math';

import 'package:flutter/material.dart';

extension Txt on Text {
  Text lay(context) {
    double? optimal = OptimalSize.optM(style?.fontSize, context);
    double optimalNotNull = optimal ?? 14;
    optimalNotNull = min(24, optimalNotNull * 2);
    optimalNotNull = max(12, optimalNotNull);
    optimalNotNull = min(style?.fontSize ?? 14, optimalNotNull);
    return copyWith(optimalNotNull);
  }

  Text copyWith(double? font) => Text(
        data!,
        key: key,
        style: style?.copyWith(fontSize: font),
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        locale: locale,
        softWrap: softWrap,
        overflow: overflow,
        textScaleFactor: textScaleFactor,
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
        selectionColor: selectionColor,
      );
}

extension IntLay on int {
  double lay(context) => OptimalSize.optI(this, context);
}

extension DoubleLay on double {
  double lay(context) => OptimalSize.optN(this, context);
}

class OptimalSize {
  static ({double height, double width}) defaultPattern =
      (height: 1057, width: 1920);

  static double _ratio(context) {
    var hw = _getHW(context);
    double r =
        min(hw.height / defaultPattern.height, hw.width / defaultPattern.width);
    return r;
  }

  static ({double height, double width}) _getHW(BuildContext context) {
    return (height: size(context).height, width: size(context).width);
  }

  static double? optM(double? size, context) {
    if (size == null) return null;
    return optN(size, context);
  }

  static double optN(double size, context) {
    var hw = _getHW(context);
    return _opt(size, hw.width, hw.height, context);
  }

  static double optI(int size, context) {
    var hw = _getHW(context);
    return _opt(size + 0.0, hw.width, hw.height, context);
  }

  static Size size(context) => MediaQuery.of(context).size;

  static double optWbyR(double ratio, BuildContext context) =>
      size(context).width * ratio;

  static double optHbyR(double ratio, BuildContext context) =>
      size(context).height * ratio;

  static double _opt(double size, double width, double height, context) {
    return (size * _ratio(context)).round() + .0;
  }
}

class EstablishLayout extends StatelessWidget {
  final Widget child;

  const EstablishLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
