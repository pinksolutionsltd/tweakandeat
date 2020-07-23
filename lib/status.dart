import 'package:flutter/material.dart';


class Status extends StatelessWidget {
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
            child: Text('Please Check Internet Connection!',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.teal
              ),),

          ),
        ],
       
      ),
    );
  }
}
