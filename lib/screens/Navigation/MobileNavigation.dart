import 'package:flutter/material.dart';
import 'package:portfolio/Enums/Navigation.dart';
import 'package:portfolio/providers/navigation_management.dart';
import 'package:provider/provider.dart';

class MobileNavigation extends StatelessWidget {
  const MobileNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MobileNavigationManagement watch =
        context.watch<MobileNavigationManagement>();
    MobileNavigationManagement read =
        context.read<MobileNavigationManagement>();
    return Row(
      children: NavigationEnum.values
          .map((e) => Expanded(
                child: GestureDetector(
                  onTap: () => read.currentNav = e,
                  child: AnimatedContainer(
                    decoration: BoxDecoration(
                        border: Border(
                      bottom: BorderSide(
                          color: watch.currentNav == e
                              ? Colors.white
                              : Colors.white.withOpacity(0.1),
                          width: 4),
                    )),
                    duration: const Duration(milliseconds: 200),
                    child: Center(
                        child: Text(
                      e.text,
                      style: const TextStyle(color: Colors.white),
                    )),
                  ),
                ),
              ))
          .toList(),
    );
  }
}
