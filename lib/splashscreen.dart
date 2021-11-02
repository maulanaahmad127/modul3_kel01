import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mod3_kel01/screens/home.dart';



class SplashScreen extends StatefulWidget {
  
  _SplashScreen createState() => _SplashScreen();

}
  
  class _SplashScreen extends State<SplashScreen>{

  void initState(){
    super.initState();
    splashscreenStart();
  }

  splashscreenStart() async{
    var duration = const Duration(seconds: 3);
    return Timer(duration, (){
      Navigator.push(
        context, 
        MaterialPageRoute(builder: (context) => HomePage()),
        
         );
    }
    );
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.indigo[600] ,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center ,
            children: <Widget>[
              Image.asset("assets/images/mal.png"),

              SizedBox(height: 24.0,),

              Text("My Anime List",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
              ),
              ),
              
            ],
          ) ,)
      );
    }

  }

