import 'package:flutter/foundation.dart';
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
    print(MediaQuery.of(context).size.width);
    print(MediaQuery.of(context).size.height);
    if (!kDebugMode) {
      if (MediaQuery.of(context).size.width < 640 ||
          MediaQuery.of(context).size.height < 500) {
        return const MaterialApp(
          home: Scaffold(
            body: Center(
              child: Text("Mobile is not supported yet"),
            ),
          ),
        );
      }
    }
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
                    (index) =>
                        DataManagement.timelineList[index].certificationDate)
                .reversed,
            null
          ];
          return const MyPortfolio();
        }),
      ),
    );
  }
}
