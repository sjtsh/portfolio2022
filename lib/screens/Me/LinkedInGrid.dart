import 'package:flutter/material.dart';
import 'package:portfolio/components/Ui%20components/ByLayout/ByLayout.dart';
import 'package:portfolio/screens/Me/WhenClicked.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkedInGrid extends StatelessWidget {
  final BoxConstraints constraints;
  final bool isClicked;
  final Function click;

  const LinkedInGrid(this.constraints, {super.key, required this.isClicked, required this.click});

  @override
  Widget build(BuildContext context) {
    return WhenClicked(
      click: ()=>click() ,
      textToShow: 'Visit My Linked In',
      onTap: () {
        click();
        launchUrl(Uri.parse("https://www.linkedin.com/in/sajat-prasad-shrestha-7483791ba/"));
      },
      isClicked: isClicked,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            decoration: BoxDecoration(
                color: const Color(0xffFFFFFF),
                borderRadius: BorderRadius.circular(12)),
            child: Stack(
              children: [
                Positioned(
                    top: 0,
                    child: Container(
                      height: 100,
                      width:constraints.maxWidth,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                          image: DecorationImage(
                              image: AssetImage("assets/me/linkedin.jpeg"),
                              fit: BoxFit.cover)),
                    )),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          height: 300,
                          width: 300,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 4),
                              image: const DecorationImage(
                                  image: AssetImage("assets/me/linkedinpp.jpeg"))),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Sajat Shrestha",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ).lay(context),
                      const Text(
                        "Open to outsourced projects",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ).lay(context),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Bagmati, Nepal",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                          fontSize: 16,
                        ),
                      ).lay(context),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "145 followers",
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                              fontSize: 16,
                            ),
                          ).lay(context),
                          SizedBox(
                            width: 10,
                          ),
                          Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(height: 4),
                                Container(
                                  height: 2,
                                  width: 2,
                                  decoration: BoxDecoration(
                                      color: Colors.black, shape: BoxShape.circle),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "139 connections",
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                              fontSize: 16,
                            ),
                          ).lay(context),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "About",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                        ),
                      ).lay(context),
                      const Text(
                        "Software developer specialized in Flutter \nProficient with GCP, Mongo and Node js \nHave worked with MySQL and django",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ).lay(context),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
