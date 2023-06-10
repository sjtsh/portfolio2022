import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../entities/SingleProject.dart';
import '../entities/timeline_content.dart';

class DataManagement {
  static List<TimelineContent> timelineList = [
    TimelineContent(
        //0
        "Bachelors First Class Honours Degree in Computer Science",
        "from University of wolverhampton",
        Container(),
        "assets/certs/bachelors.png",
        DateTime(2022, 6, 28)),
    TimelineContent(
      //6
      "Certificate for Secure Networked Systems",
      "from University of Colorado Systems",
      Container(),
      "assets/certs/Network security.jpg",
      DateTime(2020, 11, 2),
    ),
    TimelineContent(
      //4
      "Certificate for First Android App",
      "from Centrale Supelec",
      Container(),
      "assets/certs/android app.jpg",
      DateTime(2020, 11, 1),
    ),
    TimelineContent(
      //5
      "Certificate for International Cyber Conflicts",
      "from University of New York",
      Container(),
      "assets/certs/international cyber conflicts.png",
      DateTime(2020, 10, 28),
    ),
    TimelineContent(
      //7
      "Basic Python",
      "from HackerRank",
      Container(),
      "assets/certs/Python (Basic).png",
      DateTime(2020, 10, 26),
    ),
    TimelineContent(
        //3
        "Certificate for Software Security",
        "from University of Maryland",
        Container(),
        "assets/certs/Software Security.png",
        DateTime(2020, 10, 25)),
    TimelineContent(
        //2
        "Certificate for Algorithmic Toolbox",
        "from University of California San Diego",
        Container(),
        "assets/certs/Algorithmic Toolbox.jpg",
        DateTime(2020, 10, 13)),
    TimelineContent(
        //1
        "Gold level in Problem Solving Algorithms",
        "from HackerRank",
        Container(),
        "assets/certs/problem solving gold.png",
        DateTime(2020, 2, 12)),
  ];

  static List<DateTime?> dates = [];

  static List<SingleProjectObj> projects = [
    SingleProjectObj(
        "Faasto User",
        "assets/projects/icons/faastologo.png",
        "assets/projects/faastouser.png",
        const Color(0xff7E30B5),
        const Color(0xffF8F4FB),
        const Color(0xff7E30B5)),
    SingleProjectObj(
        "Faasto Delivery",
        "assets/projects/icons/faastologo.png",
        "assets/projects/faastodelivery.png",
        const Color(0xff7E30B5),
        const Color(0xffF8F4FB),
        const Color(0xff7E30B5)),
    SingleProjectObj(
        "Delivery Boy",
        "assets/projects/icons/deliveryboylogo.png",
        "assets/projects/deliveryboy.png",
        const Color(0xff00A6FB),
        const Color(0xffC1CCD4),
        const Color(0xff00A6FB)),
    SingleProjectObj(
        "Faasto Dashboard",
        "assets/projects/icons/faastologo.png",
        "assets/projects/faastodashboard.png",
        const Color(0xff7E30B5),
        const Color(0xffF8F4FB),
        const Color(0xff7E30B5)),
    SingleProjectObj(
        "SO",
        "assets/projects/icons/deliveryboylogo.png",
        "assets/projects/SO.png",
        const Color(0xffFF0000),
        const Color(0xffFFCDCD),
        const Color(0xffFF0000)),
    SingleProjectObj(
        "School Management",
        "assets/projects/icons/schoolmanagementlogo.png",
        "assets/projects/schoolmanagement.png",
        const Color(0xff1F944E),
        const Color(0xff90CAA7),
        const Color(0xff1F944E)),
    SingleProjectObj(
        "Ezsales",
        "assets/projects/icons/deliveryboylogo.png",
        "assets/projects/PSR.png",
        const Color(0xff40667D),
        const Color(0xffC1CCD4),
        const Color(0xff40667D)),
    SingleProjectObj(
        "Beat Management",
        "assets/projects/icons/createbeatlogo.png",
        "assets/projects/beatmanagement.png",
        const Color(0xff40667D),
        const Color(0xffC1CCD4),
        const Color(0xff40667D)),
    SingleProjectObj(
        "Create Beat",
        "assets/projects/icons/createbeatlogo.png",
        "assets/projects/createbeat.png",
        const Color(0xff6C63FF),
        const Color(0xffB5B0FE),
        const Color(0xff6C63FF)),
    SingleProjectObj(
        "WEAS",
        "assets/projects/icons/weaslogo.png",
        "assets/projects/weas.png",
        const Color(0xff6DA7FE),
        const Color(0xffB6D3FF),
        const Color(0xff6DA7FE)),
    SingleProjectObj(
        "Portfolio",
        "assets/projects/icons/logo.png",
        "assets/projects/portfolio.png",
        const Color(0xff1F2933),
        const Color(0xff8F9499),
        const Color(0xff1F2933)),
    SingleProjectObj(
        "Appetit",
        "assets/projects/icons/appetit.png",
        "assets/projects/appetit.png",
        Colors.black,
        const Color(0xff767676),
        const Color(0xff343434)),
  ];
}
