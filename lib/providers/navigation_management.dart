import 'package:flutter/cupertino.dart';
import 'package:portfolio/Enums/Navigation.dart';

class MobileNavigationManagement with ChangeNotifier {
  NavigationEnum _currentNav = NavigationEnum.me;

  NavigationEnum get currentNav => _currentNav;

  set currentNav(NavigationEnum value) {
    _currentNav = value;
    notifyListeners();
  }
}

// class NavigationManagement with ChangeNotifier {
//   List<(int, NavigationEnum)> currentNav = [];
//
//   bool animateNavigation = true;
//
//   DateTime lastDateTime = DateTime.now();
//
//   void changePage(int i, BuildContext context) async {
//     NavigationEnum nav = getByPosition(i);
//     if (currentNav.last.$2 != nav) currentNav.add((0, NavigationEnum.me));
//     notifyListeners();
//     await Future.delayed(const Duration(milliseconds: 50));
//     currentNav.removeLast();
//     currentNav.add((100, nav));
//     notifyListeners();
//     currentNav.add((0, NavigationEnum.me));
//     hoverPage(i);
//     // onceCleanUp();
//   }
//
//   void onceCleanUp() {
//     DateTime dt = DateTime.now();
//     lastDateTime = dt;
//     Future.delayed(const Duration(milliseconds: 1000)).then((value) {
//       if (lastDateTime == dt) {
//         cleanUp();
//       }
//     });
//   }
//
//   void cleanUp() {
//     print("cleaning up");
//     int counter = 0;
//     for (int i = currentNav.length - 1; i >= 0; i--) {
//       if (counter < 5) {
//         counter++;
//       } else {
//         currentNav.removeAt(i);
//       }
//     }
//     print(currentNav);
//   }
//
//   void removeLastIfIncomplete() {
//     if (currentNav.last.$1 != 100) {
//       currentNav.removeLast();
//     }
//   }
//
//   void changeLast(int i, NavigationEnum nav) {
//     if (currentNav.last.$2 == nav) {
//       currentNav.removeLast();
//       currentNav.add((i, nav));
//     }
//   }
//
//   Future<void> hoverPage(int i) async {
//     NavigationEnum nav = getByPosition(i);
//     removeLastIfIncomplete();
//     currentNav.add((0, nav));
//     notifyListeners();
//     changeLast(2, nav);
//     notifyListeners();
//   }
//
//   NavigationEnum getByPosition(i) {
//     return NavigationEnum.values.toList()[i];
//   }
//
//   void exitPage(int i) {
//     NavigationEnum nav = getByPosition(i);
//     changeLast(0, nav);
//     notifyListeners();
//   }
//
//   NavigationEnum get current {
//     for (int i = currentNav.length - 1; i >= 0; i--) {
//       if (currentNav[i].$1 == 100) {
//         return currentNav[i].$2;
//       }
//     }
//     return currentNav[0].$2;
//   }
// }
