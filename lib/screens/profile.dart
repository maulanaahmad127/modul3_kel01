
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  int _selectedNavbar = 1;

  @override
  void initState() {
    
  }

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, 
        title: Text("Profile"
        ,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey,fontFamily: "Montserrat-Regular"),
        ), 
        backgroundColor: Colors.black ),
        backgroundColor: Colors.indigo[100] ,
        body: Column(
          mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 50.0),
                    title: Text("Kelompok 01",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey, fontFamily: "TheHumble"),
                    textAlign: TextAlign.center),
                    tileColor: Colors.black,
          ),
          Card(
        child: 
        ListTile(
          tileColor: Colors.indigo[100],
          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage("https://cdn.myanimelist.net/images/characters/11/427601.jpg")
                        ),
          title: Text('Maulana Ahmad Rodhi Alfian', 
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black, fontFamily: "Raleway-Regular"))
          , subtitle: Text('21120119130110', 
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontFamily: "Raleway-Regular"))),
      ),
      Card(
        child: 
        ListTile(
          tileColor: Colors.indigo[100],
          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage("https://cdn.myanimelist.net/images/characters/15/422168.jpg")
                        ),
          title: Text('David Eddy Putra Pratama', 
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black, fontFamily: "Raleway-Regular"))
          , subtitle: Text('21120119130074', 
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontFamily: "Raleway-Regular"))),
      ),
      Card(
        child: 
        ListTile(
          tileColor: Colors.indigo[100],
          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage("https://cdn.myanimelist.net/images/characters/2/392689.jpg")
                        ),
          title: Text('Fachrul', 
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black, fontFamily: "Raleway-Regular"))
          , subtitle: Text('21120119130094', 
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontFamily: "Raleway-Regular"))),
      ),
      Card(
        child: 
        ListTile(
          tileColor: Colors.indigo[100],
          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage("https://cdn.myanimelist.net/images/characters/6/431152.jpg")
                        ),
          title: Text('Donito Akbar Labaya', 
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black, fontFamily: "Raleway-Regular"))
          , subtitle: Text('21120119120033', 
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontFamily: "Raleway-Regular"))),
      ),
          
        ]
        ),
          
      );
  }
}