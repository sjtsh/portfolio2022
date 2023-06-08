import 'package:flutter/cupertino.dart';
import 'package:portfolio/Enums/Navigation.dart';

class NavigationManagement with ChangeNotifier {
  List<(double, NavigationEnum)> currentNav = [
    (100, NavigationEnum.certs),
    (0, NavigationEnum.exp)
  ];
  bool animateNavigation = true;

  void changePage(int i, BuildContext context) async {
    NavigationEnum nav = getByPosition(i);
    if (currentNav.last.$2 != nav) currentNav.add((0, NavigationEnum.exp));
    notifyListeners();
    nav.init(context);
    await Future.delayed(const Duration(milliseconds: 50));
    currentNav.removeLast();
    currentNav.add((100, nav));
    notifyListeners();
    currentNav.add((0, NavigationEnum.exp));
  }

  void removeLastIfIncomplete() {
    if (currentNav.last.$1 != 100) {
      currentNav.removeLast();
    }
  }

  void changeLast(double i, NavigationEnum nav) {
    if (currentNav.last.$2 == nav) {
      currentNav.removeLast();
      currentNav.add((i, nav));
    }
  }

  Future<void> hoverPage(int i) async {
    NavigationEnum nav = getByPosition(i);
    removeLastIfIncomplete();
    currentNav.add((0, nav));
    notifyListeners();
    changeLast(2, nav);
    notifyListeners();
  }

  NavigationEnum getByPosition(i) {
    return NavigationEnum.values.where((e) => current != e).toList()[i];
  }

  void exitPage(int i) {
    NavigationEnum nav = getByPosition(i);
    changeLast(0, nav);
    notifyListeners();
  }

  NavigationEnum get current {
    for (int i = currentNav.length - 1; i >= 0; i--) {
      if (currentNav[i].$1 == 100) {
        return currentNav[i].$2;
      }
    }
    return currentNav[0].$2;
  }
}
