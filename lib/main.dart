import 'package:flutter/material.dart';
import 'package:mod3_kel01/screens/home.dart';
import 'package:mod3_kel01/screens/detail.dart';
import 'package:mod3_kel01/splashscreen.dart';


void main() async {
  runApp(const AnimeApp(
    
  ));
}



class AnimeApp extends StatelessWidget {
  const AnimeApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anime app',
      home: SplashScreen(),
      
    );
  }
  
}
