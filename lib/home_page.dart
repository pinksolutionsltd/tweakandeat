import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

      return SafeArea(
        top:true,
        child: WebviewScaffold(

            url: "http://tweakeat.dietclub.mobi/"

        ),
      );

  }
}
