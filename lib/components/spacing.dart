import 'package:flutter/material.dart';

class MySpacing {
  static EdgeInsets getEdgeInsets(double height, double width) =>
      EdgeInsets.only(
        left: width / 25,
        right: width / 25,
        // top: height / 2,
        // bottom: height / 2,
      );

  static double getLineHeight(double height) => height / 3;

  static double getLineWidth() => 2;
}

class ContentSpacing {
  static EdgeInsets getEdgeInsets(double height, double width) =>
      EdgeInsets.symmetric(
        vertical: height / 2 - MySpacing.getLineHeight(height) / 2,
      );

  static SizedBox paddingArtificial(double height, double width) =>
      SizedBox(height: height / 2 - MySpacing.getLineHeight(height) / 2);
}

class ObjectProperties {
  static Color get outerCircleColor => Colors.white.withOpacity(0.5);

  static Color get innerCircleColor => Colors.white.withOpacity(0.7);

  static double get outerCircleSize => 50;

  static double get innerCircleSize => 30;
}

class AnimationStats {
  static Duration get animationDuration => const Duration(seconds: 1);
}