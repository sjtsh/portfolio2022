import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import "package:hovering/hovering.dart";

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class GitLink extends StatefulWidget {
  final int index;

  GitLink(this.index);

  @override
  _GitLinkState createState() => _GitLinkState();
}

class _GitLinkState extends State<GitLink> {
  final List list = const [
    "https://github.com/sjtsh/Appetit",
    "https://github.com/sjtsh/Wardrobe",
    "https://github.com/sjtsh/portfolio"
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      disabledColor: Colors.grey,
      onPressed: () async {
        final Uri url = Uri.parse(list[widget.index]);
        if (!await launchUrl(url)) {
          throw Exception('Could not launch $url');
        }
      },
      child: Container(
        height: 80,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(20),
        ),
        child: HoverWidget(
          onHover: (PointerEnterEvent event) {
            setState(() {});
          },
          hoverChild: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "On Github  ",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              Icon(
                FontAwesomeIcons.github,
                color: Colors.black,
                size: 50,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "On Github  ",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Icon(
                FontAwesomeIcons.github,
                color: Colors.white,
                size: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
