import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/entities/SingleProject.dart';
import 'package:portfolio/providers/data_management.dart';
import 'package:portfolio/screens/Projects/SingleProject.dart';

class ProjectImage extends StatelessWidget {
  final SingleProjectObj project;

  ProjectImage(this.project);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 10,
          sigmaY: 10,
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.2),
                Colors.white.withOpacity(0.05),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.white.withOpacity(0.08),
            ),
          ),
          child: Container(
            margin: MediaQuery.of(context).size.width > 800
                ? EdgeInsets.all(50)
                : EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.width > 800
                ? MediaQuery.of(context).size.height * 0.6
                : MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Image.asset(
              project.projectUrl,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
