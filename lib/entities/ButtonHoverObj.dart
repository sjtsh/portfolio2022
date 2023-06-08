import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../Enums/Navigation.dart';
import '../components/spacing.dart';

class ButtonHoverObj {
  static PointerHoverEvent? lastListened;
  final GlobalKey key;
  final NavigationEnum text;

  ButtonHoverObj({required this.key, required this.text});

  double calcDistanceFurthest(offset, context) {
    double farthestW = ButtonObjectProperties.maxWidth(context) -
        ButtonObjectProperties.buttonWidth -
        ButtonObjectProperties.rightPadding;
    double farthestH = max(
        ButtonObjectProperties.maxHeight(context) -
            offset.dy -
            ButtonObjectProperties.buttonHeight,
        offset.dy);

    return sqrt(farthestW * farthestW + farthestH * farthestH);
  }

  double calcDistanceCurrent(offset) {
    double closestCurrentH = calcForYPositions(
        (dy) => (lastListened!.position.dy - dy).abs(), offset.dy);
    double closestCurrentW = calcForXPositions(
        (dx) => (lastListened!.position.dx - dx).abs(), offset.dx);

    return sqrt(
        closestCurrentH * closestCurrentH + closestCurrentW * closestCurrentW);
  }

  ({double size, double transparency}) generateMySizeRatio(context) {
    RenderObject? obj = key.currentContext?.findRenderObject();
    if (obj == null || lastListened == null) {
      return (size: 0.0, transparency: 0.0);
    }
    RenderBox box = obj as RenderBox;
    Offset offset = box.localToGlobal(Offset.zero);
    if (isInTheButton(offset)) return (size: 1, transparency: 1);
    double distance = calcDistanceFurthest(offset, context);
    double distanceCurrent = calcDistanceCurrent(offset);
    double normalizedRatio = distanceCurrent / distance;
    double transparency = 0;
    double size = 0;
    normalizedRatio = 1 - normalizedRatio;
    if (normalizedRatio < .5) {
      transparency = normalizedRatio * 2;
    } else {
      transparency = 1;
      size = (normalizedRatio - .5) * 2;
    }
    return (size: size, transparency: transparency);
  }

  ({double height, double width}) getHW(double size) {
    double minHeight = ButtonObjectProperties.buttonHeight / 3;
    double restH = ButtonObjectProperties.buttonHeight - minHeight;
    double minWidth = ButtonObjectProperties.buttonWidth / 3;
    double restW = ButtonObjectProperties.buttonWidth - minHeight;
    return (height: minHeight + restH * size, width: minWidth + restW * size);
  }

  bool isInTheButton(Offset offset) {
    if (lastListened == null) return false;
    double left = offset.dx;
    double right = offset.dx + ButtonObjectProperties.buttonWidth;
    double top = offset.dy;
    double bottom = offset.dy + ButtonObjectProperties.buttonHeight;
    return lastListened!.position.dx > left &&
        lastListened!.position.dx < right &&
        lastListened!.position.dy > top &&
        lastListened!.position.dy < bottom;
  }

  calcForYPositions(double Function(double distance) calc, double dy) {
    double top = calc(dy);
    double bottom = calc(dy + ButtonObjectProperties.buttonHeight);
    return min(top, bottom);
  }

  calcForXPositions(double Function(double distance) calc, double dx) {
    double left = calc(dx);
    double right = calc(dx + ButtonObjectProperties.buttonWidth);
    return min(left, right);
  }
}
