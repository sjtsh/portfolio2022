import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/Enums/Navigation.dart';
import 'package:portfolio/screens/Me/CVGrid.dart';
import 'package:portfolio/screens/Me/Contact.dart';

import '../../components/AnimatedListView.dart';
import 'GithubGrid.dart';
import 'GmailGrid.dart';
import 'LinkedInGrid.dart';

class MeScreen extends StatefulWidget {
  MeScreen({Key? key}) : super(key: key);

  @override
  State<MeScreen> createState() => _MeScreenState();
}

class _MeScreenState extends State<MeScreen> {
  int? currentlyClicked;

  List<Widget Function(BoxConstraints constraints)> get grids {
    click(int i) => setState(() => currentlyClicked = i);
    return [
      (BoxConstraints c) => GithubGrid(c,
          click: () => click(0), isClicked: 0 == currentlyClicked),
      (BoxConstraints c) =>
          CVGrid(c, click: () => click(1), isClicked: 1 == currentlyClicked),
      (BoxConstraints c) => LinkedInGrid(c,
          click: () => click(2), isClicked: 2 == currentlyClicked),
      (BoxConstraints c) =>
          GmailGrid(c, click: () => click(3), isClicked: 3 == currentlyClicked),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 100, left: 30.0, right: 30),
          child: Builder(builder: (context) {
            List<Widget> children = grids.map((e) => get(e)).toList();
            return AnimatedListView(ListView(children: children));
          }),
        ),
        Contact()
      ],
    );
  }

  Widget get(Widget Function(BoxConstraints constraints) grid) {
    return Builder(builder: (context) {
      double maxWidth = (MediaQuery.of(context).size.width > 640)
          ? ((MediaQuery.of(context).size.width - 90) / 2)
          : (MediaQuery.of(context).size.width - 60);
      return SizedBox(
        height: 600,
        width: min(maxWidth, 600),
        child: LayoutBuilder(builder: (context, BoxConstraints constraints) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12)),
            child: grid(constraints),
          );
        }),
      );
    });
  }
}
