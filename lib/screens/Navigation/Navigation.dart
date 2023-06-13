import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/providers/navigation_management.dart';
import 'package:portfolio/screens/Navigation/MobileNavigation.dart';
import 'package:provider/provider.dart';

import '../../Enums/Navigation.dart';
import '../../components/Ui components/ByLayout/ByLayout.dart';
import '../../components/spacing.dart';
import '../../entities/ButtonHoverObj.dart';

class Navigation extends StatelessWidget {
  bool isMobileWidth;

  Navigation({super.key, this.isMobileWidth = false});

  @override
  Widget build(BuildContext context) {
    if (isMobileWidth) {
      return Positioned(
          top: 0,
          height: 60,
          width: OptimalSize.optWbyR(1, context),
          child: const MobileNavigation());
    }
    return Positioned(
        top: 0,
        height: OptimalSize.optHbyR(0.1, context),
        width: OptimalSize.optWbyR(1, context),
        child: const AnimatedNavigation());
  }
}

class AnimatedNavigation extends StatefulWidget {
  const AnimatedNavigation({super.key});

  @override
  State<AnimatedNavigation> createState() => _AnimatedNavigationState();
}

class _AnimatedNavigationState extends State<AnimatedNavigation> {
  final GlobalKey key1 = GlobalKey();
  final GlobalKey key2 = GlobalKey();
  final GlobalKey key3 = GlobalKey();

  startAnimating(PointerEnterEvent listener) => print("start");

  onHover(PointerHoverEvent listener) =>
      setState(() => ButtonHoverObj.lastListened = listener);

  onExit(PointerExitEvent listener) =>
      setState(() => ButtonHoverObj.lastListened = null);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: startAnimating,
      onHover: onHover,
      onExit: onExit,
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            Expanded(
              child: Builder(builder: (context) {
                List<NavigationEnum> presentable =
                    NavigationEnum.values.toList();
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(flex: 3, child: Container()),
                    for (int i = 0; i < presentable.length; i++) ...[
                      Expanded(flex: 1, child: buildButton(i, presentable[i])),
                      Expanded(flex: 1, child: Container())
                    ],
                    Expanded(flex: 2, child: Container()),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton(int i, NavigationEnum nav) {
    ButtonHoverObj obj = ButtonHoverObj(
        key: switch (i) { 0 => key1, 1 => key3, _ => key2 }, text: nav);
    var sizeTrans = obj.generateMySizeRatio(context);
    var hw = obj.getHW(sizeTrans.size);
    return Align(
      alignment: Alignment.centerRight,
      child: AnimatedOpacity(
        opacity: context.watch<MobileNavigationManagement>().currentNav == nav
            ? 1
            : min(1, sizeTrans.transparency.abs() + 0.2),
        duration: const Duration(milliseconds: 200),
        child: GestureDetector(
          onTap: () =>
              context.read<MobileNavigationManagement>().currentNav = nav,
          child: Container(
            key: obj.key,
            height: ButtonObjectProperties.buttonHeight,
            width: ButtonObjectProperties.buttonWidth,
            child: Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: hw.height,
                width: hw.width,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: AutoSizeText(obj.text.text,
                          style: const TextStyle(
                              fontSize: 40, color: Colors.white))),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
