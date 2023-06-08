import 'package:flutter/material.dart';

import '../../entities/SingleProject.dart';
import 'ProjectImage.dart';
import 'ProjectText.dart';
import 'Spheres.dart';

class SingleProject extends StatelessWidget {
  final SingleProjectObj project;
  final int index;

  const SingleProject(this.project, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: MediaQuery.of(context).size.width > 800 ? 9 : 1,
          child: Stack(
            children: [
              Spheres1(project),
              Spheres3(project),
              Column(
                children: [
                  MediaQuery.of(context).size.width > 800
                      ? Expanded(child: Container())
                      : Container(),
                  MediaQuery.of(context).size.width > 800
                      ? Expanded(child: Container())
                      : Container(),
                  ProjectImage(project),
                  MediaQuery.of(context).size.width > 800
                      ? Expanded(child: Container())
                      : Container(),
                ],
              ),
              Spheres2(project),
              Spheres4(project),
            ],
          ),
        ),
      ],
    );
  }
}
