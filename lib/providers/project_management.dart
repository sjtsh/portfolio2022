import 'package:flutter/cupertino.dart';

class ProjectManagement with ChangeNotifier {
  int? hoveringIndex;
  int currentIndex = 0;
  PageController controller = PageController();
  ScrollController scroll = ScrollController();
  late double maxWidth;

  clickedIndicator(int index) async {
      await controller.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.bounceInOut);
  }

  changeIndex(int index) {
    currentIndex = index;
    centerElement(index);
    notifyListeners();
  }

  hoverIndicator(int index) {
    hoveringIndex = index;
    notifyListeners();
  }

  exitIndicator(int index) {
    hoveringIndex = null;
    notifyListeners();
  }

  centerElement(int index) {
    double singleObjWidth = 200;
    double padSize = 20;
    // scroll.ma
    scroll.animateTo((singleObjWidth + padSize) * index - padSize,
        duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
  }
}
