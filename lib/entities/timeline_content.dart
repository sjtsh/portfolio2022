import 'package:flutter/cupertino.dart';

class TimelineContent{
  final String headline;
  final String snippet; 
  final Widget widget;
  final String assetURL;
  final DateTime certificationDate;
  TimelineContent(this.headline, this.snippet, this.widget, this.assetURL, this.certificationDate);
}