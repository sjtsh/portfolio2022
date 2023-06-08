import 'package:flutter/material.dart';
import 'package:portfolio/providers/navigation_management.dart';
import 'package:portfolio/screens/Navigation/NavigationAnimation.dart';
import 'package:provider/provider.dart';

import '../Enums/Navigation.dart';
import '../screens/Navigation/Navigation.dart';

class MyPortfolio extends StatelessWidget {
  const MyPortfolio({Key? key}) : super(key: key);

  List<Widget> elaborate(int counter, List<(double, NavigationEnum)> items) {
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
          return Stack(
            children: [
              ...elaborate(2, context.watch<NavigationManagement>().currentNav),
              const Navigation(),
            ],
          );
        }),
      ),
    );
  }
}
