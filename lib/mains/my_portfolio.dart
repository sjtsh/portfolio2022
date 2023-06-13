import 'package:flutter/material.dart';
import 'package:portfolio/providers/navigation_management.dart';
import 'package:portfolio/screens/Navigation/MobileNavigation.dart';
import 'package:portfolio/screens/Navigation/NavigationAnimation.dart';
import 'package:provider/provider.dart';

import '../Enums/Navigation.dart';
import '../screens/Navigation/Navigation.dart';

class MyPortfolio extends StatelessWidget {
  const MyPortfolio({Key? key}) : super(key: key);

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
              children: [
                NavigationAnimation((
                  100,
                  context.watch<MobileNavigationManagement>().currentNav
                )),
                Navigation()
              ],
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
