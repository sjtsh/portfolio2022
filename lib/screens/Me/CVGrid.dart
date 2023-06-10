import 'package:flutter/material.dart';
import 'package:portfolio/screens/Me/WhenClicked.dart';
import 'package:url_launcher/url_launcher.dart';

class CVGrid extends StatelessWidget {
  final BoxConstraints constraints;
  final bool isClicked;
  final Function click;

  const CVGrid(this.constraints, {super.key, required this.isClicked, required this.click});

  @override
  Widget build(BuildContext context) {
    return WhenClicked(
      isClicked:isClicked,
      textToShow: 'Download My CV',
      onTap: () {
        click();
        launchUrl(Uri.parse(
            "https://drive.google.com/u/0/uc?id=1XiGHyb2OABE-sIvqJX3xnQXlHN7SQp1A&export=download"));
      },
      click: ()=>click() ,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white.withOpacity(0.5), width: 8)),
        child: Center(child: Image.asset("assets/me/cv.png")),
      ),
    );
  }
}
