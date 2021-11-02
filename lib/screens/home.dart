

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mod3_kel01/screens/detail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mod3_kel01/screens/detail2.dart';
import 'package:mod3_kel01/screens/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Show>> shows;
  late Future<List<ShowPopular>> showsPopular;
  
  final screens = [
    HomePage(),
    Profile()
  ];

  @override
  void initState() {
    super.initState();
    shows = fetchShows();
    showsPopular = fetchShowsPopular();
  }

  

  

   

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: const Text('MyAnimeList'),
      actions: <Widget>[
    TextButton(
      onPressed: () {Navigator.push(
        context, 
        MaterialPageRoute(builder: (context) => Profile()),
        
         );},
      child: Text("Profile", style: TextStyle(color: Colors.white),),
      
    ),
  ],),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
         
          ListTile(
            contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 1.0),
                    title: Text("Most Watched Anime of All Time",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center),
          ),

          Container(
        height: 270.0,
        
        child: FutureBuilder(
          builder: (context, AsyncSnapshot<List<ShowPopular>> snapshot){
            if (snapshot.hasData){
              return Center(
                child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: snapshot.data!.length,
          itemBuilder: (BuildContext context, int index) => Card(

            child: Container(
              width: 150,
                child: Column(
                  children: <Widget> [
                    Expanded(
                      child: Stack(
                        children:<Widget> [
                          Ink.image(image: NetworkImage(snapshot.data![index].imageUrl), fit: BoxFit.fill,
                          
                        child: InkWell(
                          
                          
                          onTap: (){
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage2(
                                  item: snapshot.data![index].malId,
                                  title: snapshot.data![index].title),
                            ),
                          );
                          },
                        ),
                        ),

                        ],
                        
                    )
                      ),
                      const SizedBox(height: 4,),  
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 0.0, vertical: 0.0,),
                        title: Text(snapshot.data![index].title,
                         style: TextStyle(fontWeight: FontWeight.bold),
                         textAlign: TextAlign.center,
                         ),
                      ),
                     ]
                ),
              
            )
            
              
                )
                   
                  ),

              );
            }else if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong :('));
            }
            return const CircularProgressIndicator();
          } ,
          future: showsPopular,
        ),
        
      ),
          ListTile(
          
            contentPadding: const EdgeInsets.symmetric(
                            horizontal: 2.0, vertical: 10.0),
                    title: Text("Top Anime of All Time",
                    style: TextStyle(fontSize: 20)
                    ,
                    textAlign: TextAlign.center),
                    
          ),
          Expanded(
            child: FutureBuilder(
          builder: (context, AsyncSnapshot<List<Show>> snapshot2) {
            if (snapshot2.hasData) {
              return Center(
                child: ListView.builder(
                  itemCount: snapshot2.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      color: Colors.white,
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              NetworkImage(snapshot2.data![index].imageUrl),
                        ),
                        title: Text(snapshot2.data![index].title),
                        subtitle: Text('Score: ${snapshot2.data![index].score}'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(
                                  item: snapshot2.data![index].malId,
                                  title: snapshot2.data![index].title),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              );
            } else if (snapshot2.hasError) {
              return const Center(child: Text('Something went wrong :('));
            }
            return const CircularProgressIndicator();
          },
          future: shows,
        ),
          ),
        ],
      ),
      
    );
    
    
  }
  

  
}

class Show {
  final int malId;
  final String title;
  final String imageUrl;
  final num score;

  Show({
    required this.malId,
    required this.title,
    required this.imageUrl,
    required this.score,
  });

  factory Show.fromJson(Map<String, dynamic> json) {
    return Show(
      malId: json['mal_id'],
      title: json['title'],
      imageUrl: json['image_url'],
      score: json['score'],
    );
  }
}

class ShowPopular {
  final int malId;
  final String title;
  final String imageUrl;
  final num score;


  ShowPopular({
    required this.malId,
    required this.title,
    required this.imageUrl,
    required this.score,
    
  });

  factory ShowPopular.fromJson(Map<String, dynamic> json) {
    return ShowPopular(
      malId: json['mal_id'],
      title: json['title'],
      imageUrl: json['image_url'],
      score: json['score'],
    );
  }
}

Future<List<Show>> fetchShows() async {
  final response =
      await http.get(Uri.parse('https://api.jikan.moe/v3/top/anime/1'));

  if (response.statusCode == 200) {
    var topShowsJson = jsonDecode(response.body)['top'] as List;
    return topShowsJson.map((show) => Show.fromJson(show)).toList();
  } else {
    throw Exception('Failed to load shows');
  }
}

Future<List<ShowPopular>> fetchShowsPopular() async {
  final response =
      await http.get(Uri.parse('https://api.jikan.moe/v3/top/anime/1/bypopularity'));

  if (response.statusCode == 200) {
    var topShowsJson = jsonDecode(response.body)['top'] as List;
    return topShowsJson.map((showPopular) => ShowPopular.fromJson(showPopular)).toList();
  } else {
    throw Exception('Failed to load shows');
  }
}