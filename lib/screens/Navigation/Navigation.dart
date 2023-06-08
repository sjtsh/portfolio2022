import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/providers/navigation_management.dart';
import 'package:provider/provider.dart';

import '../../Enums/Navigation.dart';
import '../../components/Ui components/ByLayout/ByLayout.dart';
import '../../components/spacing.dart';
import '../../entities/ButtonHoverObj.dart';

class Navigation extends StatelessWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 0,
        height: OptimalSize.optHbyR(1),
        width: OptimalSize.optWbyR(0.3),
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
        child: Row(
          children: [
            Expanded(
              child: Builder(builder: (context) {
                NavigationManagement watch =
                    context.watch<NavigationManagement>();
                List<NavigationEnum> presentable = NavigationEnum.values
                    .where((element) => element != watch.current)
                    .toList();
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(flex: 3, child: Container()),
                    for (int i = 0; i < presentable.length; i++) ...[
                      buildButton(i, presentable[i]),
                      Expanded(flex: 1, child: Container())
                    ],
                    Expanded(flex: 2, child: Container()),
                  ],
                );
              }),
            ),
            SizedBox(width: ButtonObjectProperties.rightPadding),
          ],
        ),
      ),
    );
  }

  Widget buildButton(int i, NavigationEnum nav) {
    ButtonHoverObj obj =
        ButtonHoverObj(key: switch (i) { 1 => key1, _ => key2 }, text: nav);
    var sizeTrans = obj.generateMySizeRatio();
    var hw = obj.getHW(sizeTrans.size);
    return Align(
      alignment: Alignment.centerRight,
      child: AnimatedOpacity(
        opacity: min(1, sizeTrans.transparency.abs() + 0.2),
        duration: const Duration(milliseconds: 200),
        child: MouseRegion(
          onEnter: (PointerEnterEvent listener) =>
              context.read<NavigationManagement>().hoverPage(i),
          onExit: (PointerExitEvent listener) =>
              context.read<NavigationManagement>().exitPage(i),
          child: GestureDetector(
            onTap: () => context.read<NavigationManagement>().changePage(i, context),
            child: SizedBox(
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
                        child: Text(obj.text.text,
                                style: const TextStyle(
                                    fontSize: 40, color: Colors.white))
                            .lay),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
