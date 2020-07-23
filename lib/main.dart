import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/services.dart';
import 'package:tweakandeat/splash_screen.dart';
import 'package:tweakandeat/splash_screen.dart';

import 'home_page.dart';
import 'network_check.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Diet Club',
      home: CheckNetworkPage(),
    );
  }
}

