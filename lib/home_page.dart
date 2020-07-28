import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:splashscreen/splashscreen.dart';

import 'helper.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

      return MaterialApp(

        home: SafeArea(
          child:WebviewScaffold(

            url: "http://tweakeat.dietclub.mobi/",

            withZoom: true,
            withLocalStorage: true,
            hidden: true,
            initialChild: Container(
              color: Color(Helper.getHexToInt("#58EAF8")),
              child: const Center(
                child: Text('Please Wait.....',
                  style: TextStyle(
                    fontSize: 28.0,
                      color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),),
              ),),


            bottomNavigationBar: new BottomAppBar(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[

                  new IconButton(icon: Icon(FontAwesomeIcons.home, color: Color(Helper.getHexToInt("#E9003D")),),
                      onPressed:(){

                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));

                      }),
                 FlatButton(
                   child: Text('Exit', style: TextStyle(color: Color(Helper.getHexToInt("#E9003D"))),),
                   onPressed: (){
                     SystemNavigator.pop();
                   },
                 ),
                ],
              ),
            ),
          ),
        ),


      );
  }
}


//SystemNavigator.pop();