import 'dart:math';

import 'package:flutter/material.dart';

import 'GithubGrid.dart';
import 'GmailGrid.dart';
import 'LinkedInGrid.dart';

class MeScreen extends StatelessWidget {
  MeScreen({Key? key}) : super(key: key);

  final List<Widget Function(BoxConstraints constraints)> grids = [
    (BoxConstraints c) => GithubGrid(c),
    (BoxConstraints c) => LinkedInGrid(c),
    (BoxConstraints c) => GmailGrid(c),
    (BoxConstraints c) => GmailGrid(c),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100, left: 30.0, right: 30),
      child: ListView(
        children: [
          for (int i = 0; i < 4; i += 2) ...[
            Row(
              children: [
                Expanded(child: Container()),
                get(grids[i]),
                const SizedBox(width: 30),
                get(grids[i + 1]),
                Expanded(child: Container())
              ],
            ),
            const SizedBox(height: 30),
          ]
        ],
      ),
    );
  }

  Widget get(Widget Function(BoxConstraints constraints) grid) {
    return Builder(builder: (context) {
      double maxWidth = (MediaQuery.of(context).size.width - 90) / 2;
      print(maxWidth);
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
