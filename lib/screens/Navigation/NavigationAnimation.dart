import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/providers/navigation_management.dart';
import 'package:provider/provider.dart';

import '../../Enums/Navigation.dart';

class NavigationAnimation extends StatelessWidget {
  final (double, NavigationEnum) nav;

  NavigationAnimation(this.nav, {super.key});


  @override
  Widget build(BuildContext context) {
    double percentDouble = nav.$1 / 100;
    double totalWidth = MediaQuery.of(context).size.width;
    double totalHeight = MediaQuery.of(context).size.height;
    double width = totalWidth* percentDouble;
    NavigationManagement watch = context.watch<NavigationManagement>();
    bool animateNavigation = watch.animateNavigation;
    return AnimatedPositioned(
      width: totalWidth,
      left: totalWidth - width,
      duration: Duration(
          milliseconds:
          animateNavigation ? max(200, (500 * percentDouble).floor()):0),
      child: Container(
        height: totalHeight,
        width: totalWidth,
        color: nav.$2.color,
        child: nav.$2.screen(context),
      ),
    );
  }
}
