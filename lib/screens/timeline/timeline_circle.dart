import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/timeline_management.dart';
import '../../components/spacing.dart';

class TimelineCircle extends StatelessWidget {
  final int index;

  const TimelineCircle(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ObjectProperties.outerCircleSize,
      width: ObjectProperties.outerCircleSize,
      decoration: BoxDecoration(
          color: ObjectProperties.outerCircleColor, shape: BoxShape.circle),
      child: Center(
        child: AnimatedContainer(
          height: ObjectProperties.innerCircleSize,
          width: ObjectProperties.innerCircleSize,
          decoration: BoxDecoration(
              color: index == context.watch<TimelineManagement>().currentItem
                  ? const Color(0xff007b07)
                  : ObjectProperties.innerCircleColor,
              shape: BoxShape.circle),
          duration: const Duration(milliseconds: 200),
        ),
      ),
    );
  }
}
