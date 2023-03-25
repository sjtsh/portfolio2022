import 'package:flutter/material.dart';
import 'package:portfolio/providers/data_management.dart';
import 'package:portfolio/providers/timeline_management.dart';
import 'package:provider/provider.dart';

import 'my_portfolio.dart';

class ProviderManagement extends StatelessWidget {
  const ProviderManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return DataManagement();
        }),
        ChangeNotifierProvider(create: (_) {
          return TimelineManagement();
        }),
      ],
      child: Builder(builder: (context) {
        // context
        //     .read<DataManagement>()
        //     .timelineList
        //     .sort((b, a) => a.certificationDate.compareTo(b.certificationDate));
        // List a = [];
        // for (var i in context.read<DataManagement>().timelineList) {
        //   a.add(context.read<DataManagement>().timelineListCopy.indexOf(context
        //       .read<DataManagement>()
        //       .timelineListCopy
        //       .firstWhere((e) => e.assetURL == i.assetURL)));
        // }
        // print(a);
        context.read<DataManagement>().dates = [
          null,
          ...List.generate(
              context.read<DataManagement>().timelineList.length,
              (index) => context
                  .read<DataManagement>()
                  .timelineList[index]
                  .certificationDate).reversed,
          null
        ];
        return const MyPortfolio();
      }),
    );
  }
}
