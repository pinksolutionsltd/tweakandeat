import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            child: Text('Try Again',
              style: TextStyle(fontSize: 20.0, color: Colors.white),),
          ),

        ],

      ),
    );
  }
}
