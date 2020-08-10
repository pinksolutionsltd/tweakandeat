import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:io';
import 'faq_page.dart';
import 'helper.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<bool> _checkNetwork()async{
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        return true;
      }
    } on SocketException catch (_) {
      print('not connected');
      return false;
    }
  }


  _showToast() {
    Fluttertoast.showToast(
        msg: "Please Check Internet Connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Color(Helper.getHexToInt("#56E8F7")),
        textColor: Color(Helper.getHexToInt("#1565AB")),
        fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {

    setState((){
      _checkNetwork();
    });

      return SafeArea(
          child:WebviewScaffold(

            url: "http://tweakeat.dietclub.mobi/",

            withZoom: true,
            withLocalStorage: true,
            hidden: true,
            initialChild: Container(
              width: double.infinity,
              height: double.infinity,
              color: Color(Helper.getHexToInt("#58EAF8")),
              child: Column(
//                mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
                children: <Widget>[

                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 80, 20, 40),
                    child: Container(
                      child: Image.asset('images/small-logo.png', height: 70.0,width: 200.0,),
                    ),
                  ),



                  Padding(
                    padding: EdgeInsets.all(40.0),
                    child: Text("Don't forget to take a photo of your next meal and send it to me!",style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                    ),),
                  ),


                  Padding(padding: EdgeInsets.all(20.0),

                      child: Image.asset('images/camera-icon.png', height: 100.0,width: 220.0,),

                  ),



                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 60, 40, 40),
                    child: Text('Please Wait......',style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                    ),),
                  ),

                ],

              )),


            bottomNavigationBar: new BottomAppBar(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[

                  FlatButton(
                    child: Image.asset('images/home.png', height: 25.0,width: 25.0,),
                    onPressed: ()async{
                      var value = await _checkNetwork();

                      if(value){
                        Navigator.push(context,MaterialPageRoute(builder: (context) => HomePage()),);
                      }
                      else{
                        _showToast();
                      }
                    },
                  ),


                  GestureDetector(
                    onTap: ()async{
                      var value = await _checkNetwork();

                      if(value){
                        Navigator.push(context,MaterialPageRoute(builder: (context) => FAQPage()),);
                      }
                      else{
                        _showToast();
                      }

                    },
                    child: Image.asset('images/faq.png', height: 25.0,width: 25.0,),
                  ),


                  FlatButton(
                   child: Image.asset('images/exit.png', height: 25.0,width: 25.0,),
                   onPressed: (){
                     SystemNavigator.pop();
                   },
                 ),
                ],
              ),
            ),
          ),
        );


  }
}


//SystemNavigator.pop();