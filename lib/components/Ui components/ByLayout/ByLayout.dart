import 'dart:math';

import 'package:flutter/material.dart';

extension Txt on Text {
  Text get lay => copyWith(OptimalSize.optM(style?.fontSize));

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
  double get lay => OptimalSize.optI(this);
}

extension DoubleLay on double {
  double get lay => OptimalSize.optN(this);
}

class OptimalSize {
  static ({double height, double width}) defaultPattern =
      (height: 1057, width: 1920);
  static late Size size;

  static double _ratio() {
    var hw = _getHW();
    double r =
        min(hw.height / defaultPattern.height, hw.width / defaultPattern.width);
    return r;
  }

  static ({double height, double width}) _getHW() {
    return (height: size.height, width: size.width);
  }

  static double? optM(double? size) {
    if (size == null) return null;
    return optN(size);
  }

  static double optN(double size) {
    var hw = _getHW();
    return _opt(size, hw.width, hw.height);
  }

  static double optI(int size) {
    var hw = _getHW();
    return _opt(size + 0.0, hw.width, hw.height);
  }

  static double optWbyR(double ratio) => size.width * ratio;
  static double optHbyR(double ratio) => size.height * ratio;

  static double _opt(double size, double width, double height) {
    return (size * _ratio()).round() + .0;
  }
}

class EstablishLayout extends StatelessWidget {
  final Widget child;

  const EstablishLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OptimalSize.size = MediaQuery.of(context).size;
    return child;
  }
}
