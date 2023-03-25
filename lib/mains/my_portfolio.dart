import 'package:flutter/material.dart';
import 'package:portfolio/screens/timeline/timeline_screen.dart';

class MyPortfolio extends StatelessWidget {
  const MyPortfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.black, ),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: MyTimeline(),
      ),
    );
  }
}
