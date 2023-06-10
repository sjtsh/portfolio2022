import 'package:flutter/material.dart';
import 'package:portfolio/providers/data_management.dart';
import 'package:portfolio/providers/timeline_management.dart';
import 'package:portfolio/components/spacing.dart';
import 'package:portfolio/screens/Certs/timeline/timeline_circle.dart';
import 'package:portfolio/screens/Certs/timeline/timeline_content.dart';
import 'package:provider/provider.dart';

import 'date_scroll_view.dart';
import 'line_segment.dart';

class MyTimeline extends StatefulWidget {
  final bool isMobile;
  final Color color;

  MyTimeline(this.color, this.isMobile);

  @override
  State<MyTimeline> createState() => _MyTimelineState();
}

class _MyTimelineState extends State<MyTimeline> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 200)).then(
      (value) => !mounted
          ? 1
          : context.read<TimelineManagement>().initiateScroll(
              MediaQuery.of(context).size.height,
              DataManagement.timelineList.length,
              widget.isMobile),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.color,
      body: LayoutBuilder(builder: (context, BoxConstraints constraints) {
        List<Widget> children(bool isMobile) => [
              if (isMobile) const SizedBox(height: 72),
              SizedBox(
                width: isMobile ? null : 100,
                height: isMobile ? 40 : null,
                child: DateScrollView(constraints, isMobile),
              ),
              RotatedBox(
                quarterTurns: isMobile ? 1 : 0,
                child:  Icon(
                  Icons.arrow_left_rounded,
                  size: isMobile ? 30: 80,
                  color: Colors.white,
                ),
              ),
              buildMyCerts(constraints, isMobile),
            ];
        if (constraints.maxWidth < 480) return Column(children: children(true));
        return Row(children: children(false));
      }),
    );
  }

  Widget buildMyCerts(constraints, bool isMobile) {
    TimelineManagement readTimeline = context.read<TimelineManagement>();
    return Expanded(
      child: ListView(
          addRepaintBoundaries: false,
          controller: readTimeline.contentScrollController,
          children: [
            if (!isMobile)
              ContentSpacing.paddingArtificial(
                  constraints.maxHeight, constraints.maxWidth),
            ...DataManagement.timelineList.asMap().entries.map((e) {
              int a = (context.watch<TimelineManagement>().currentItem - e.key);
              double formerOpacity = 1 - a.abs() / 2;
              double opacity = formerOpacity < 0 ? 0 : formerOpacity;
              return Row(
                children: [
                  Padding(
                    padding: MySpacing.getEdgeInsets(
                        constraints.maxHeight, constraints.maxWidth),
                    child: Column(
                      children: [
                        0 == e.key
                            ? Container(
                                height: MySpacing.getLineHeight(
                                    constraints.maxHeight / 2),
                              )
                            : LineSegment(constraints, e.key - 1, false),
                        TimelineCircle(e.key),
                        DataManagement.timelineList.length - 1 == e.key
                            ? Container(
                                height: MySpacing.getLineHeight(
                                    constraints.maxHeight / 2),
                              )
                            : LineSegment(constraints, e.key, true)
                      ],
                    ),
                  ),
                  Expanded(
                    child: Opacity(
                      opacity: opacity,
                      child: TimelineContentWidget(constraints, e.value, e.key),
                    ),
                  ),
                ],
              );
            }),
            ContentSpacing.paddingArtificial(
                constraints.maxHeight, constraints.maxWidth),
          ]),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:portfolio/providers/data_management.dart';
// import 'package:portfolio/providers/timeline_management.dart';
// import 'package:portfolio/screens/timeline/date_scroll_view.dart';
// import 'package:portfolio/screens/timeline/line_segment.dart';
// import 'package:portfolio/screens/timeline/timeline_circle.dart';
// import 'package:portfolio/screens/timeline/timeline_content.dart';
// import 'package:portfolio/components/spacing.dart';
// import 'package:provider/provider.dart';
//
// class MyTimeline extends StatefulWidget {
//   const MyTimeline({Key? key}) : super(key: key);
//
//   @override
//   State<MyTimeline> createState() => _MyTimelineState();
// }
//
// class _MyTimelineState extends State<MyTimeline> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     Future.delayed(const Duration(milliseconds: 200)).then(
//       (value) => context.read<TimelineManagement>().initiateScroll(
//             MediaQuery.of(context).size.height,
//             context.read<DataManagement>().timelineList.length,
//           ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     DataManagement readData = context.read<DataManagement>();
//     TimelineManagement readTimeline = context.read<TimelineManagement>();
//     return Scaffold(
//       body: LayoutBuilder(builder: (context, BoxConstraints constraints) {
//         return Stack(
//           children: [
//             Row(
//               children: [
//                 SizedBox(
//                   width: 100,
//                   child: DateScrollView(constraints),
//                 ),
//                 const Icon(
//                   Icons.arrow_left_rounded,
//                   size: 80,
//                   color: Colors.white,
//                 ),
//                 Expanded(
//                   child: SingleChildScrollView(
//                     controller: readTimeline.contentScrollController,
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: MySpacing.getEdgeInsets(
//                               constraints.maxHeight, constraints.maxWidth),
//                           child: Column(
//                             children: readData.timelineList
//                                 .asMap()
//                                 .entries
//                                 .map((e) => Column(
//                                       children: [
//                                         TimelineCircle(e.key),
//                                         readData.timelineList.length - 1 ==
//                                                 e.key
//                                             ? Container()
//                                             : LineSegment(constraints, e.key)
//                                       ],
//                                     ))
//                                 .toList(),
//                           ),
//                         ),
//                         Expanded(
//                           child: Padding(
//                             padding: ContentSpacing.getEdgeInsets(
//                                 constraints.maxHeight, constraints.maxWidth),
//                             child: Column(
//                                 children: readData.timelineList
//                                     .asMap()
//                                     .entries
//                                     .map((e) {
//                               int a = (context
//                                       .watch<TimelineManagement>()
//                                       .currentItem -
//                                   e.key);
//                               double formerOpacity = 1 - a.abs() / 2;
//                               double opacity =
//                                   formerOpacity < 0 ? 0 : formerOpacity;
//                               return Opacity(
//                                 opacity: opacity,
//                                 child: TimelineContentWidget(
//                                     constraints, e.value, e.key),
//                               );
//                             }).toList()),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         );
//       }),
//     );
//   }
// }
