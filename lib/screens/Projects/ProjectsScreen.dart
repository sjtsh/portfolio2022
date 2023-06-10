import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio/providers/data_management.dart';
import 'package:portfolio/providers/project_management.dart';
import 'package:provider/provider.dart';

import 'Indicator.dart';
import 'SingleProject.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  _ProjectsScreenState createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProjectManagement(),
      child: Builder(builder: (context) {
        ProjectManagement read = context.read<ProjectManagement>();
        read.maxWidth = MediaQuery.of(context).size.width;
        return Column(
          children: [
            Expanded(
              child: PageView(
                controller: context.read<ProjectManagement>().controller,
                onPageChanged: (int i) =>
                    context.read<ProjectManagement>().changeIndex(i),
                pageSnapping: true,
                children: [
                  for (int i = 0; i < DataManagement.projects.length; i++)
                    SingleProject(DataManagement.projects[i], i)
                ],
              ),
            ),
            const Indicator()
          ],
        );
      }),
    );
  }
}
