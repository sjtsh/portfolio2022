import 'package:flutter/material.dart';
import '../../entities/SingleProject.dart';
import 'GitLink.dart';

class ProjectText extends StatelessWidget {
  final SingleProjectObj project;

  ProjectText(this.project);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width > 800
          ? MediaQuery.of(context).size.width * 0.6
          : MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.width > 800
          ? MediaQuery.of(context).size.height * 0.8
          : MediaQuery.of(context).size.height * 1.1,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: MediaQuery.of(context).size.width > 800
            ? const EdgeInsets.all(20.0)
            : const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  project.title,
                  style: TextStyle(
                    color: Color(0xffD3FFE6),
                    fontWeight: FontWeight.w500,
                    fontFamily: "Roboto",
                    fontSize: MediaQuery.of(context).size.width > 800 ? 40 : 16,
                  ),
                ),
                MediaQuery.of(context).size.width > 800
                    ? SizedBox(width: 30)
                    : SizedBox(
                        width: 5,
                      ),
                MediaQuery.of(context).size.width > 800
                    ? Image.asset(
                        project.logoUrl,
                        fit: BoxFit.contain,
                        width: 70,
                        height: 70,
                      )
                    : Image.asset(
                        project.logoUrl,
                        fit: BoxFit.contain,
                        width: 30,
                        height: 30,
                      ),
              ],
            ),
            MediaQuery.of(context).size.width > 800
                ? Expanded(child: Container())
                : Container(),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
