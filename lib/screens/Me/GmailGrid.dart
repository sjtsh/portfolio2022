import 'package:flutter/material.dart';
import 'package:portfolio/components/Ui%20components/ByLayout/ByLayout.dart';
import 'package:portfolio/screens/Me/WhenClicked.dart';
import 'package:url_launcher/url_launcher.dart';

class GmailGrid extends StatelessWidget {
  final BoxConstraints constraints;
  final bool isClicked;
  final Function click;

  const GmailGrid(this.constraints,
      {super.key, required this.isClicked, required this.click});

  @override
  Widget build(BuildContext context) {
    return WhenClicked(
      textToShow: 'Mail me',
      onTap: () {
        click();

        String url =
            'mailto:mastersajat@gmail.com?subject=${"From the website"}&body=Hi, I am ';
        launchUrl(Uri.parse(url));
      },
      isClicked: isClicked,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xffF3F6FC), width: 8)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 64,
                        width: 64,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage("assets/me/gmail.jpg"))),
                      ),
                      Positioned(
                        bottom: -4,
                        right: -4,
                        child: Container(
                            height: 28,
                            width: 28,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            )),
                      ),
                      Positioned(
                        bottom: -2,
                        right: -2,
                        child: Container(
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.5))),
                          child: Icon(Icons.camera_alt_outlined,
                              color: Colors.black.withOpacity(0.5), size: 12),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Sajat Shrestha",
                            style: TextStyle(color: Color(0xff565656))).lay(context),
                        SizedBox(height: 4),
                        Text(
                          "mastersajat@gmail.com",
                          style: TextStyle(color: Color(0xff808281)),
                        ).lay(context)
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black.withOpacity(0.1)),
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Basic info",
                      style: TextStyle(fontSize: 22, color: Color(0xff202124)),
                    ).lay(context),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.all(16).copyWith(left: 0, right: 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Birthday",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff5f6368),
                                fontWeight: FontWeight.bold),
                          ).lay(context),
                          SizedBox(
                            width: 30,
                          ),
                          Expanded(
                            child: Text(
                              "August 5, 2002",
                              style: TextStyle(
                                  fontSize: 16, color: Color(0xff202124)),
                            ).lay(context),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xff5f6368),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.black.withOpacity(0.1),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "More options",
                      style: TextStyle(fontSize: 12, color: Color(0xff5f6368)),
                    ).lay(context),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black.withOpacity(0.1)),
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Contact info",
                      style: TextStyle(fontSize: 22, color: Color(0xff202124)),
                    ).lay(context),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.all(16).copyWith(left: 0, right: 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Email",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff5f6368),
                                fontWeight: FontWeight.bold),
                          ).lay(context),
                          SizedBox(
                            width: 30,
                          ),
                          Expanded(
                            child: Text(
                              "mastersajat@gmail.com",
                              style: TextStyle(
                                  fontSize: 16, color: Color(0xff202124)),
                            ).lay(context),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xff5f6368),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.black.withOpacity(0.1),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.all(16).copyWith(left: 0, right: 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Phone",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff5f6368),
                                fontWeight: FontWeight.bold),
                          ).lay(context),
                          SizedBox(
                            width: 30,
                          ),
                          Expanded(
                            child: Text(
                              "986-0277521",
                              style: TextStyle(
                                  fontSize: 16, color: Color(0xff202124)),
                            ).lay(context),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xff5f6368),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.black.withOpacity(0.1),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "More options",
                      style: TextStyle(fontSize: 12, color: Color(0xff5f6368)),
                    ).lay(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
