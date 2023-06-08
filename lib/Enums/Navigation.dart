import 'package:flutter/material.dart';
import 'package:portfolio/providers/timeline_management.dart';
import 'package:portfolio/screens/Certs/Certs.dart';
import 'package:portfolio/screens/Me/MeScreen.dart';
import 'package:provider/provider.dart';

import '../screens/Projects/ProjectHome.dart';


enum NavigationEnum {
  certs,
  me,
  proj;

  String get text {
    switch (this) {
      case NavigationEnum.certs:
        return "Certs";
      case NavigationEnum.proj:
        return "Proj";
      case NavigationEnum.me:
        return "Me";
    }
  }

  Color get color {
    // return Colors.black;
    switch (this) {
      case NavigationEnum.certs:
        return const Color(0xff191919);
      case NavigationEnum.proj:
        return const Color(0xff333333);
      case NavigationEnum.me:
        return Colors.black;
    }
  }

  Widget screen(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: switch (this) {
          NavigationEnum.certs => const Certs(),
          NavigationEnum.proj => const ProjectHome(),
          NavigationEnum.me =>  MeScreen(),
        });
  }
}
