import 'package:flutter/material.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'helper.dart';
import 'home_page.dart';
import 'network_check.dart';


class Status extends StatefulWidget {
  final internetStatus;
  Status({this.internetStatus});

  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {

  bool _getNet = false;
_checkNetwork()async{
  _getNet = await DataConnectionChecker().hasConnection;
  print(_getNet.toString());
}


  _showToast() {
    Fluttertoast.showToast(
        msg: "Please Check Internet Connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }


  @override
  Widget build(BuildContext context) {

    setState((){
      _checkNetwork();
    });

    return Scaffold(


      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Container(
            child: Image.asset('images/myicon.png'),
            height: 400.0,
            width: 400.0,
          ),

          Center(
            child: Text(widget.internetStatus.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.teal
              ),),

          ),

          Divider(height: 20.0,),

          RaisedButton(
            color: Color(Helper.getHexToInt("#007d99")),
            onPressed: (){

                if(_getNet){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => HomePage()),);
                }
                else{
                  _showToast();
                }
            },
            child: Text('Try Again',
              style: TextStyle(fontSize: 20.0, color: Colors.white),),
          ),

        ],

      ),
    );
  }
}
