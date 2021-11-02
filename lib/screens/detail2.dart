import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailPage2 extends StatefulWidget {
  final int item;
  final String title;
  const DetailPage2({Key? key, required this.item, required this.title})
      : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage2> {
  late Future<List<Episode>> episodes;
  late Future<Detail> details;

  @override
  void initState() {
    super.initState();
    episodes = fetchEpisodes(widget.item);
    details = fetchDetail(widget.item); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Container(
          child: FutureBuilder(
        builder: (context, AsyncSnapshot<Detail> snapshot) {
          if(snapshot.hasData){
            return Column(
                  children:  [
                      AspectRatio(
                        aspectRatio: 4/3,
                        child:Image(image: NetworkImage(snapshot.data!.imageUrl),
                        ),
                    ),
                         Text("Rating :  "+snapshot.data!.rating,
                         style: TextStyle(fontSize: 13),
                         textAlign: TextAlign.left,
                         ),
                        Text("duration :  "+snapshot.data!.duration,
                         style: TextStyle(fontSize: 13),
                         ),
                         Text("Score :  "+snapshot.data!.score.toString(),
                         style: TextStyle(fontSize: 13),
                         ),
                      ListTile(
                        title: Text("synopsis :\n"+snapshot.data!.synopsis,
                          style: TextStyle(fontSize: 12),
                         textAlign: TextAlign.left,
                         ),
                        
                      ),
                    
                     ]
               
              
            
            
            );
          }else if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong :('));
            }
          
          return const CircularProgressIndicator();
        },
        future: details,
      )),
    );
  }
}

class Episode {
  final int episodeId;
  final String title2;

  Episode({required this.episodeId, required this.title2});

  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(episodeId: json['episode_id'], title2: json['title']);
  }
}

class Detail {
  final int malId;
  final String duration;
  final String title;
  final String rating;
  final String synopsis;
  final String imageUrl;
  final num score;


  Detail({
    required this.synopsis,
    required this.duration,
    required this.rating,
    required this.malId,
    required this.title,
    required this.imageUrl,
    required this.score,
    
  });

  factory Detail.fromJson(Map<String, dynamic> json) {
    return Detail(
      duration: json['duration'],
      synopsis: json['synopsis'],
      rating: json['rating'],
      malId: json['mal_id'],
      title: json['title'],
      imageUrl: json['image_url'],
      score: json['score'],
    );
  }
}

Future<List<Episode>> fetchEpisodes(id) async {
  final response = await http
      .get(Uri.parse('https://api.jikan.moe/v3/anime/$id/episodes/1'));

  if (response.statusCode == 200) {
    var episodesJson = jsonDecode(response.body)['episodes'] as List;
    return episodesJson.map((episode) => Episode.fromJson(episode)).toList();
  } else {
    throw Exception('Failed to load episodes');
  }
}

Future<Detail> fetchDetail(id) async {
  final response =
await http.get(Uri.parse('https://api.jikan.moe/v3/anime/$id'));
    var map = json.decode(response.body);

  if (response.statusCode == 200) {
    
    return Detail.fromJson(map);

    
  } else {
    throw Exception('Failed to load shows');
  }
}
