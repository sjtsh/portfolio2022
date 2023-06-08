import 'package:flutter/material.dart';
import 'package:portfolio/providers/data_management.dart';
import 'package:portfolio/providers/navigation_management.dart';
import 'package:portfolio/providers/timeline_management.dart';
import 'package:provider/provider.dart';

import '../components/Ui components/ByLayout/ByLayout.dart';
import 'my_portfolio.dart';

class ProviderManagement extends StatelessWidget {
  const ProviderManagement({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return NavigationManagement();
        }),
      ],
      child: EstablishLayout(
        child: Builder(builder: (context) {
          DataManagement.dates = [
            null,
            ...List.generate(
                DataManagement.timelineList.length,
                (index) => DataManagement
                    .timelineList[index]
                    .certificationDate).reversed,
            null
          ];
          return const MyPortfolio();
        }),
      ),
    );
  }
}
