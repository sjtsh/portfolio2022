import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/providers/data_management.dart';
import 'package:portfolio/providers/project_management.dart';
import 'package:provider/provider.dart';

class Indicator extends StatelessWidget {
  const Indicator({super.key});

  @override
  Widget build(BuildContext context) {
    ProjectManagement watch = context.watch<ProjectManagement>();
    ProjectManagement read = context.read<ProjectManagement>();
    int? currentIndex = watch.currentIndex;
    return SizedBox(
      height: 200,
      child: ListView(
          controller: read.scroll,
          scrollDirection: Axis.horizontal,
          children: [
            SizedBox(width: read.maxWidth / 2 - 100),
            for (int i = 0; i < DataManagement.projects.length; i++) ...[
              Builder(builder: (context) {
                bool selected = currentIndex == i;
                bool hovering = watch.hoveringIndex == i;
                return GestureDetector(
                  onTap: () =>
                      context.read<ProjectManagement>().clickedIndicator(i),
                  child: MouseRegion(
                    onEnter: (PointerEnterEvent listener) =>
                        context.read<ProjectManagement>().hoverIndicator(i),
                    onExit: (PointerExitEvent listener) =>
                        context.read<ProjectManagement>().exitIndicator(i),
                    child: SizedBox(
                      height: 200,
                      child: Center(
                        child: AnimatedContainer(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: DataManagement.projects[i].primaryColor
                                  .withOpacity(0.5)),
                          height: hovering ? 200 : 100,
                          width: hovering ? 400 : 200,
                          duration: const Duration(milliseconds: 200),
                          child: Stack(
                            children: [
                              Center(
                                  child: Image.asset(
                                      DataManagement.projects[i].projectUrl)),
                              Positioned.fill(
                                child: AnimatedOpacity(
                                  duration: const Duration(milliseconds: 400),
                                  opacity: selected || hovering ? .7 : 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              if (selected || hovering)
                                Center(
                                  child: AutoSizeText(
                                    DataManagement.projects[i].title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 25),
                                    maxLines: 1,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
              const SizedBox(width: 20)
            ],
            SizedBox(width: read.maxWidth / 2 - 100),
          ]),
    );
  }
}
