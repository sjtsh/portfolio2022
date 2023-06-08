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
    SingleProjectObj("Appetit","assets/projects/icons/appetit.png", "assets/projects/appetit.png",
        Colors.black, const Color(0xff767676), const Color(0xff343434)),
    SingleProjectObj("Wardrobe",
        "assets/projects/icons/wardrobe.png",
        "assets/projects/wardrobe.png",
        const Color(0xff0065FF),
        const Color(0xffD2E4FF),
        const Color(0xff0065FF)),
    SingleProjectObj("Portfolio",
        "assets/projects/icons/portfolio.png",
        "assets/projects/portfolio.png",
        const Color(0xffFF0000),
        const Color(0xffFFCDCD),
        const Color(0xffFF0000)),
    SingleProjectObj("Appetit","assets/projects/icons/appetit.png", "assets/projects/appetit.png",
        Colors.black, const Color(0xff767676), const Color(0xff343434)),
    SingleProjectObj("Wardrobe",
        "assets/projects/icons/wardrobe.png",
        "assets/projects/wardrobe.png",
        const Color(0xff0065FF),
        const Color(0xffD2E4FF),
        const Color(0xff0065FF)),
    SingleProjectObj("Portfolio",
        "assets/projects/icons/portfolio.png",
        "assets/projects/portfolio.png",
        const Color(0xffFF0000),
        const Color(0xffFFCDCD),
        const Color(0xffFF0000)),
    SingleProjectObj("Appetit","assets/projects/icons/appetit.png", "assets/projects/appetit.png",
        Colors.black, const Color(0xff767676), const Color(0xff343434)),
    SingleProjectObj("Wardrobe",
        "assets/projects/icons/wardrobe.png",
        "assets/projects/wardrobe.png",
        const Color(0xff0065FF),
        const Color(0xffD2E4FF),
        const Color(0xff0065FF)),
    SingleProjectObj("Portfolio",
        "assets/projects/icons/portfolio.png",
        "assets/projects/portfolio.png",
        const Color(0xffFF0000),
        const Color(0xffFFCDCD),
        const Color(0xffFF0000)),
    SingleProjectObj("Appetit","assets/projects/icons/appetit.png", "assets/projects/appetit.png",
        Colors.black, const Color(0xff767676), const Color(0xff343434)),
    SingleProjectObj("Wardrobe",
        "assets/projects/icons/wardrobe.png",
        "assets/projects/wardrobe.png",
        const Color(0xff0065FF),
        const Color(0xffD2E4FF),
        const Color(0xff0065FF)),
    SingleProjectObj("Portfolio",
        "assets/projects/icons/portfolio.png",
        "assets/projects/portfolio.png",
        const Color(0xffFF0000),
        const Color(0xffFFCDCD),
        const Color(0xffFF0000)),
    SingleProjectObj("Appetit","assets/projects/icons/appetit.png", "assets/projects/appetit.png",
        Colors.black, const Color(0xff767676), const Color(0xff343434)),
    SingleProjectObj("Wardrobe",
        "assets/projects/icons/wardrobe.png",
        "assets/projects/wardrobe.png",
        const Color(0xff0065FF),
        const Color(0xffD2E4FF),
        const Color(0xff0065FF)),
    SingleProjectObj("Portfolio",
        "assets/projects/icons/portfolio.png",
        "assets/projects/portfolio.png",
        const Color(0xffFF0000),
        const Color(0xffFFCDCD),
        const Color(0xffFF0000))
  ];
}
