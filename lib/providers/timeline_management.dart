import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import '../components/spacing.dart';

class TimelineManagement with DiagnosticableTreeMixin, ChangeNotifier {
  bool segmentAnimation = false;

  int currentItem = 0;
  bool animationIncreaseHeight = false;
  int? animationChangePosition;
  int? animationChangePositionAhead;
  bool segmentAnimationMutex = false;

  ScrollController contentScrollController = ScrollController();

  ScrollController wheelScrollController =
      ScrollController(initialScrollOffset: 80);

  initiateScroll(double height, int timelineListLength) {
    double offset =
        (MySpacing.getLineHeight(height) * (timelineListLength - 1) / 2) +
            MySpacing.getLineHeight(height) / 3;
    wheelScrollController.animateTo(offset,
        duration: AnimationStats.animationDuration, curve: Curves.easeInOut);

    contentScrollController.addListener(() {
      int newScrolledIndex = (contentScrollController.offset) ~/
          (ObjectProperties.outerCircleSize + MySpacing.getLineHeight(height));
      if (newScrolledIndex != currentItem) {
        changeIndexByScroll(newScrolledIndex, height, timelineListLength);
      }
    });
  }

  //change by index with scroll
  changeIndexByScroll(
      int newCurrentItem, double height, int timelineListLength) {
    bool isForward = newCurrentItem > currentItem;
    currentItem = newCurrentItem;
    notifyListeners();
    if (segmentAnimation) {
      animateSegment(isForward);
    }
    scrollWheel(height, timelineListLength);
  }

  animateSegment(bool isForward) {
    if (!segmentAnimationMutex) {
      segmentAnimationMutex = true;
      if (isForward) {
        animationChangePositionAhead = currentItem;
      } else {
        animationChangePosition = (currentItem) * -1;
      }
      notifyListeners();
      Future.delayed(Duration(milliseconds: 600)).then((value) {
        if (isForward) {
          animationChangePosition = currentItem;
        } else {
          animationChangePositionAhead = (currentItem) * -1;
        }
        notifyListeners();
      });
      Future.delayed(Duration(seconds: 2)).then((value) {
        animationChangePosition = null;
        segmentAnimationMutex = false;
      });
    }
  }

  //scrolls the left wheel
  scrollWheel(double height, int timelineListLength) {
    wheelScrollController.animateTo(
      (MySpacing.getLineHeight(height) *
              (timelineListLength - 1 - currentItem) /
              2) +
          MySpacing.getLineHeight(height) / 3,
      // ObjectProperties.outerCircleSize,
      duration: AnimationStats.animationDuration,
      curve: Curves.easeInOut,
    );
  }

// //scrolls the content
// scrollContentList(double height) {
//   double newOffset = currentItem *
//       (ObjectProperties.outerCircleSize + MySpacing.getLineHeight(height));
//   contentScrollController.animateTo(newOffset,
//       duration: AnimationStats.animationDuration, curve: Curves.easeInOut);
// }
//
// //change by index programmatically
// changeByIndex(int newCurrentItem, double height, int timelineListLength) {
//   currentItem = newCurrentItem;
//   changeIndex(height, timelineListLength);
// }
//
// //increment in index programmatically
// incrementInIndex(double height, int timelineListLength) {
//   if (currentItem == timelineListLength - 1) {
//     currentItem = 0;
//   } else {
//     currentItem++;
//   }
//   changeIndex(height, timelineListLength);
// }
//
// //whenever there in change in index programmatically
// changeIndex(double height, int timelineListLength) {
//   scrollContentList(height);
//   scrollWheel(height, timelineListLength);
//   animateSegment(true);
//   notifyListeners();
//   animateSegmentBack(1);
// }
}
