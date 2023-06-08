import 'package:flutter/material.dart';
import 'package:portfolio/providers/timeline_management.dart';
import 'package:provider/provider.dart';

import '../../../components/spacing.dart';


class LineSegment extends StatelessWidget {
  final BoxConstraints constraints;
  final int index;
  final bool isAhead;

  const LineSegment(this.constraints, this.index, this.isAhead, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool forward = (isAhead
            ? context.watch<TimelineManagement>().animationChangePositionAhead
            : context.watch<TimelineManagement>().animationChangePosition) ==
        index + 1;
    bool backward = (isAhead
            ? context.watch<TimelineManagement>().animationChangePositionAhead
            : context.watch<TimelineManagement>().animationChangePosition) ==
        (index) * -1;
    return Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        Container(
          height: MySpacing.getLineHeight(constraints.maxHeight / 2),
          width: MySpacing.getLineWidth(),
          color: Colors.white.withOpacity(0.8),
        ),
        AnimatedPositioned(
          top: forward ? MySpacing.getLineHeight(constraints.maxHeight / 2) : 0,
          duration: forward
              ? AnimationStats.animationDuration
              : const Duration(seconds: 0),
          child: Container(
            height: forward
                ? MySpacing.getLineHeight(constraints.maxHeight / 2) / 2
                : 0,
            width: MySpacing.getLineWidth(),
            color: forward ? Color(0xff007b07): Colors.transparent,
            // duration: AnimationStats.animationDuration,
          ),
        ),
        AnimatedPositioned(
          bottom:
              backward ? MySpacing.getLineHeight(constraints.maxHeight / 2) : 0,
          duration: backward
              ? AnimationStats.animationDuration
              : const Duration(seconds: 0),
          child: Container(
            height: backward
                ? MySpacing.getLineHeight(constraints.maxHeight / 2) / 2
                : 0,
            width: MySpacing.getLineWidth(),
            color: backward ? Color(0xff007b07): Colors.transparent,
            // duration: AnimationStats.animationDuration,
          ),
        ),
      ],
    );
  }
}
