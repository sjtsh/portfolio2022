import 'package:flutter/material.dart';
import 'package:portfolio/providers/timeline_management.dart';
import 'package:provider/provider.dart';

import '../screens/timeline/timeline_screen.dart';

enum NavigationEnum {
  certs,
  proj,
  exp;

  String get text {
    switch (this) {
      case NavigationEnum.certs:
        return "Certs";
      case NavigationEnum.proj:
        return "Proj";
      case NavigationEnum.exp:
        return "Exp";
    }
  }

  Color get color {
    // return Colors.black;
    switch (this) {
      case NavigationEnum.certs:
        return const Color(0xff191919);
      case NavigationEnum.proj:
        return const Color(0xff333333);
      case NavigationEnum.exp:
        return Colors.black;
    }
  }

  init(BuildContext context) {
    if (this == NavigationEnum.certs) {
      context.read<TimelineManagement>().contentScrollController =
          ScrollController();
      context.read<TimelineManagement>().wheelScrollController =
          ScrollController();
      print(
          context
              .read<TimelineManagement>()
              .contentScrollController.hasClients);
    }
  }

  Widget screen(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: switch (this) {
          NavigationEnum.certs => MyTimeline(color),
          NavigationEnum.proj => Placeholder(),
          NavigationEnum.exp => Placeholder(),
        });
  }
}
