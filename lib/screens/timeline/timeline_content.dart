import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/providers/timeline_management.dart';
import 'package:portfolio/entities/timeline_content.dart';
import 'package:provider/provider.dart';

import '../../components/spacing.dart';

class TimelineContentWidget extends StatelessWidget {
  final BoxConstraints constraints;
  final TimelineContent content;
  final int index;

  const TimelineContentWidget(this.constraints, this.content, this.index,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50 + constraints.maxHeight / 3,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            content.headline,
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(color: Colors.white),
          ),
          Text(
            content.snippet,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: Colors.white.withOpacity(0.5)),
          ),
          const SizedBox(height: 20),
          MouseRegion(
            cursor: SystemMouseCursors.grab,
            onEnter: (enter) {
              showDialog(
                  context: context,
                  builder: (_) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Stack(
                        alignment: Alignment.center,
                          children: [
                            Image.asset(content.assetURL, fit: BoxFit.contain),
                            Positioned(
                              right: 20,
                              top: 20,
                              child: Container(
                              height: 60,width: 250,
                                color: Color(0xff295881),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical:10.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.info,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Expanded(
                                          child: Text(
                                        "Tap anywhere to exit",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            },
            onExit: (exit) {
              print(Navigator.canPop(context));
              // Navigator.pop(context);
            },
            child: AnimatedContainer(
              height: index == context.watch<TimelineManagement>().currentItem
                  ? MySpacing.getLineHeight(constraints.maxHeight) * 2 / 3
                  : 0,
              duration: AnimationStats.animationDuration,
              child: Image.asset(content.assetURL, fit: BoxFit.contain),
            ),
          )
        ],
      ),
    );
  }
}
