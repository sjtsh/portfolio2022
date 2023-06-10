import 'package:flutter/material.dart';
import 'package:portfolio/providers/navigation_management.dart';
import 'package:portfolio/screens/Navigation/MobileNavigation.dart';
import 'package:portfolio/screens/Navigation/NavigationAnimation.dart';
import 'package:provider/provider.dart';

import '../Enums/Navigation.dart';
import '../screens/Navigation/Navigation.dart';

class MyPortfolio extends StatelessWidget {
  const MyPortfolio({Key? key}) : super(key: key);

  List<Widget> elaborate(int counter, List<(int, NavigationEnum)> items) {
    List<Widget> children = [];

    for (var item in items) {
      children.add(counter == 0 ? Container() : NavigationAnimation(item));
      counter--;
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: LayoutBuilder(builder: (context, constraints) {
          if (MediaQuery.of(context).size.width > 480) {
            return Stack(
              children: [...elaborate(2, context
              .watch<NavigationManagement>()
              .currentNav), Navigation()],
            );
          }
          return Stack(
            children: [
              context
                  .watch<MobileNavigationManagement>()
                  .currentNav
                  .screen(context),
              Navigation(isMobileWidth: true)
            ],
          );
        }),
      ),
    );
  }
}
