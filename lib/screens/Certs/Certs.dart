import 'package:flutter/material.dart';
import 'package:portfolio/screens/Certs/timeline/timeline_screen.dart';
import 'package:provider/provider.dart';

import '../../Enums/Navigation.dart';
import '../../providers/timeline_management.dart';

class Certs extends StatelessWidget {
  const Certs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => TimelineManagement(),
        child: MyTimeline(NavigationEnum.certs.color));
  }
}
