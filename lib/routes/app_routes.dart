import 'package:flutter/material.dart';
import 'package:flutter_navigator_app/main.dart';
import 'package:flutter_navigator_app/pages/basic-nav.dart';
import 'package:flutter_navigator_app/pages/navigation_result.dart';
import 'package:flutter_navigator_app/pages/veri_aktarimi.dart';

class AppRoutes {
  static const String home = '/';
  static const String basic = '/basic';
  static const String veriaktarim = '/veri aktarım';
  static const String result = '/result';
  static Map<String, Widget Function(BuildContext)> get routes => {
    home: (context) => homepage(),
    basic: (context) => basicnavigation(),
    veriaktarim: (context) => veriaktarimidemo(),
    result: (context) => navigationresults(),
  };
}
