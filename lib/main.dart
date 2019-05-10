import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MovieApps(),
    );
  }
}

class MovieApps extends StatefulWidget {
  MovieApps({Key key}) : super(key: key);

  _MovieAppsState createState() => _MovieAppsState();
}

class _MovieAppsState extends State<MovieApps> {

  List<Container> listMovie = List();

  var daftarMovie = [
    {"nama":"aquaman", "images":"aquaman.jpg"},
    {"nama":"avenger", "images":"avenger.jpg"},
    {"nama":"birdbox", "images":"birdbox.jpg"},
    {"nama":"bohemian", "images":"bohemian.jpg"},
    {"nama":"bumblebee", "images":"bumblebee.jpg"},
    {"nama":"creed", "images":"creed.jpg"},
    {"nama":"deadpool", "images":"deadpool.jpg"},
    {"nama":"dragon", "images":"dragon.jpg"},
    {"nama":"dragonball", "images":"dragonball.jpg"},
    {"nama":"glass", "images":"glass.jpg"},
    {"nama":"star", "images":"star.jpg"},
  ];

_buatDataList(){
    for(var i=0;i<daftarMovie.length;i++){
      final listMovienya = daftarMovie[i];
      final String images = listMovienya['images'];

      listMovie.add(new Container(
        padding: EdgeInsets.all(10.0),
        child: Card(
          child: InkWell(
            onTap: (){
              //pindah ke detail
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailMovieApp(
                nama: listMovienya["nama"],
                gambar: listMovienya["images"],
              )));
            },
            child: Column(
              children: <Widget>[
                Hero(
                  tag: listMovienya['nama'],
                  child: Image.asset("gambar/$images",
                  fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                ),
                Text(listMovienya['nama'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),)
              ],
            ),
          ),
        ),
      ));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _buatDataList();
  }

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight -24)/2;
    final double itemWidth = size.width/2;

    return Scaffold(
      appBar: AppBar(
        title: Text("Movie Apps"),
        backgroundColor: Colors.red,
      ),

      resizeToAvoidBottomPadding: false,
      body: Container(
        child: GridView.count(
          childAspectRatio: (itemWidth/itemHeight),
          controller: ScrollController(keepScrollOffset: false),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          crossAxisCount: 2,
          children: listMovie,
        ),
      ),
    );
  }
}


class DetailMovieApp extends StatelessWidget {
  
  DetailMovieApp({this.nama, this.gambar});

  final String nama;
  final String gambar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            height: 300,
            child: Hero(tag: nama, child: Material(
              child: InkWell(
                child: Image.asset('gambar/$gambar', fit: BoxFit.contain,),
              ),
            ),),
          ),
          BagianNama(
            nama: nama
          ),
          BagianIcon(),
          BagianKeterangan(),
        ],
      ),
    );
  }
}

class BagianNama extends StatelessWidget {
  
  BagianNama({this.nama});
  final String nama;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                nama,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.red,
                ),
              ),
              Text(
                "$nama\@gmail.com",
                style: TextStyle(
                  fontSize: 17.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),),

          Row(
            children: <Widget>[
              Icon(Icons.star,size: 30.0, color: Colors.yellow,),
              Text("12", style: TextStyle(fontSize: 18.0,)),
            ],
          ),

        ],
      ),
    );
  }
}

class BagianIcon extends StatelessWidget {
  const BagianIcon({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          IconTeks(
            iconData: Icons.call,
            teks : "Call",
          ),
          IconTeks(
            iconData: Icons.call,
            teks : "Call",
          ),
          IconTeks(
            iconData: Icons.message,
            teks : "Message",
          ),
          IconTeks(
            iconData: Icons.photo,
            teks : "Photo",
          ),
        ],
      ),
    );
  }
}


class IconTeks extends StatelessWidget {
  
  IconTeks({
    this.iconData,
    this.teks,
  });

  final IconData iconData;
  final String teks;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Icon(iconData, size: 20.0, color:Colors.red,),
          Text(teks, style: TextStyle(fontSize: 12.0,color: Colors.red,),),
        ],
      ),
    );
  }
}

class BagianKeterangan extends StatelessWidget {
  const BagianKeterangan({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", style: TextStyle(fontSize: 14.0), textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}