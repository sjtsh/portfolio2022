import 'package:flutter/material.dart';

class GmailGrid extends StatelessWidget {
  final BoxConstraints constraints;

  const GmailGrid(this.constraints, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12)
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
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
                              image: AssetImage("assets/me/github.jpeg"))),
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
                            border:
                                Border.all(color: Colors.black.withOpacity(0.5))),
                        child:  Icon(Icons.camera_alt_outlined,
                            color: Colors.black.withOpacity(0.5), size: 12),
                      ),
                    )
                  ],
                ),
                Column(children: [
                  Text("Sajat Shrestha"),
                  SizedBox(height: 4,),
                  Text("mastersajat@gmail.com")
                ],)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
