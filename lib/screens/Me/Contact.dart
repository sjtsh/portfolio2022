import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MiniContact extends StatelessWidget {
  const MiniContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 12,
      bottom: 12,
      child: GestureDetector(
        onTap: () {
          String url = 'tel://9860277521';
          launchUrl(Uri.parse(url));
        },
        child: Container(
          decoration: BoxDecoration(
              color: const Color(0xff7386ff),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white)),
          height: 60,
          width: 60,
          child: const Icon(
            Icons.phone,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }
}

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < 480) return MiniContact();
    return Positioned(
      right: 30,
      bottom: 30,
      child: GestureDetector(
        onTap: () {
          String url =
              'mailto:mastersajat@gmail.com?subject=${"From the website"}&body=Hi, I am ';
          launchUrl(Uri.parse(url));
        },
        child: MouseRegion(
          onHover: (_) => setState(() => isHovering = true),
          onExit: (_) => setState(() => isHovering = false),
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              AnimatedContainer(
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(40)),
                  height: 80,
                  width: isHovering ? 300 : 80,
                  duration: const Duration(milliseconds: 200),
                  child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: AutoSizeText(
                          "Contact through mail",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                          maxLines: 1,
                        ),
                      ))),
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xff7386ff),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white)),
                height: 80,
                width: 80,
                child: const Icon(
                  Icons.mail,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
