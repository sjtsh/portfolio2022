import 'package:flutter/material.dart';

import '../../entities/SingleProject.dart';
import '../../providers/data_management.dart';

class Spheres1 extends StatelessWidget {
  final SingleProjectObj project;

  Spheres1(this.project);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 800
        ? Positioned(
            top: 30,
            right: 150,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    project.secondaryColor1,
                    project.secondaryColor2
                  ],
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: project.primaryColor
                          .withOpacity(0.5),
                      blurRadius: 20,
                      spreadRadius: 10)
                ],
              ),
            ),
          )
        : Container();
  }
}

class Spheres2 extends StatelessWidget {
  final SingleProjectObj project;

  Spheres2(this.project);
  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 800
        ? Positioned(
            top: 80,
            left: 800,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                   project.secondaryColor1,
                   project.secondaryColor2
                  ],
                ),
                shape: BoxShape.circle,
              ),
            ),
          )
        : Container();
  }
}

class Spheres3 extends StatelessWidget {
  final SingleProjectObj project;

  Spheres3(this.project);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 800
        ? Positioned(
            bottom: 50,
            right: 800,
            child: Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                   project.secondaryColor1,
                   project.secondaryColor2
                  ],
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color:project.primaryColor
                          .withOpacity(0.2),
                      blurRadius: 20,
                      spreadRadius: 10)
                ],
              ),
            ),
          )
        : Container();
  }
}

class Spheres4 extends StatelessWidget {
  final SingleProjectObj project;

  Spheres4(this.project);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 800
        ? Positioned(
            bottom: 40,
            left: 100,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                   project.secondaryColor1,
                   project.secondaryColor2
                  ],
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color:project.primaryColor
                          .withOpacity(0.25),
                      blurRadius: 20,
                      spreadRadius: 10)
                ],
              ),
            ),
          )
        : Container();
  }
}
