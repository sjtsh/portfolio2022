import 'package:flutter/material.dart';
import 'package:portfolio/providers/data_management.dart';
import 'package:portfolio/providers/timeline_management.dart';
import 'package:portfolio/screens/timeline/date_scroll_view.dart';
import 'package:portfolio/screens/timeline/line_segment.dart';
import 'package:portfolio/screens/timeline/timeline_circle.dart';
import 'package:portfolio/screens/timeline/timeline_content.dart';
import 'package:portfolio/components/spacing.dart';
import 'package:provider/provider.dart';

class MyTimeline extends StatefulWidget {
  final Color color;

  MyTimeline(this.color);

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
              context.read<DataManagement>().timelineList.length),
    );
  }




  @override
  Widget build(BuildContext context) {
    DataManagement readData = context.read<DataManagement>();
    TimelineManagement readTimeline = context.read<TimelineManagement>();
    return Scaffold(
      backgroundColor: widget.color,
      body: LayoutBuilder(builder: (context, BoxConstraints constraints) {
        return Row(
          children: [
            SizedBox(
              width: 100,
              child: DateScrollView(constraints),
            ),
            const Icon(
              Icons.arrow_left_rounded,
              size: 80,
              color: Colors.white,
            ),
            Expanded(
              child: ListView(
                  addRepaintBoundaries: false,
                  controller: readTimeline.contentScrollController,
                  children: [
                    ContentSpacing.paddingArtificial(
                        constraints.maxHeight, constraints.maxWidth),
                    ...readData.timelineList.asMap().entries.map((e) {
                      int a = (context.watch<TimelineManagement>().currentItem -
                          e.key);
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
                                    : LineSegment(
                                        constraints, e.key - 1, false),
                                TimelineCircle(e.key),
                                readData.timelineList.length - 1 == e.key
                                    ? Container(
                                        height: MySpacing.getLineHeight(
                                            constraints.maxHeight / 2),
                                      )
                                    : LineSegment(constraints, e.key, true)
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: Opacity(
                                opacity: opacity,
                                child: TimelineContentWidget(
                                    constraints, e.value, e.key),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                    ContentSpacing.paddingArtificial(
                        constraints.maxHeight, constraints.maxWidth),
                  ]),
            ),
          ],
        );
      }),
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
