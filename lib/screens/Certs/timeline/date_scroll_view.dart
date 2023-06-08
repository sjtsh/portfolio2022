import 'package:flutter/material.dart';
import 'package:portfolio/components/Ui%20components/ByLayout/ByLayout.dart';
import 'package:portfolio/components/spacing.dart';
import 'package:provider/provider.dart';

import '../../../providers/data_management.dart';
import '../../../providers/timeline_management.dart';


class DateScrollView extends StatelessWidget {
  final BoxConstraints constraints;

  DateScrollView(this.constraints, {Key? key}) : super(key: key);

  final List<String> monthList = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  @override
  Widget build(BuildContext context) {
    TimelineManagement readTimeline = context.read<TimelineManagement>();
    return ListWheelScrollView(
        physics: const NeverScrollableScrollPhysics(),
        controller: readTimeline.wheelScrollController,
        magnification: 2,
        diameterRatio: 2,
        itemExtent: MySpacing.getLineHeight(constraints.maxHeight) / 2,
        // itemExtent: ObjectProperties.outerCircleSize +
        //     MySpacing.getLineHeight(constraints.maxHeight),
        children: DataManagement.dates
            .map((e) => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  (e?.year ?? "").toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 30),
                ).lay(context),
                Text(
                  (e == null ? "" : "${monthList[e.month]} ${e.day}")
                      .toString(),
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.5), fontSize: 20),
                ).lay(context),
              ],
            ))
            .toList());
  }
}
