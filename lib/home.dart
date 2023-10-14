// Creado por: Marco Antonio Rosas Gonzalez
// Asignatura: Desarrollo Movil Integral
//Grado: 10   Grupo: "A"
// Docente: MTI. Marco Antonio Ramirez Hernandez
import 'package:flutter/material.dart'; // Importa la biblioteca Flutter para construir interfaces de usuario.
import 'package:movieapp_200749/common/HttpHandler.dart'; // Importa la clase HttpHandler desde un archivo llamado HttpHandler.dart.
import 'package:movieapp_200749/media_list.dart';
import 'package:movieapp_200749/common/MediaProvider.dart';
import 'package:movieapp_200749/model/Media.dart';

class Home extends StatefulWidget {
  const Home(
      {super.key});
  @override
  State<Home> createState() =>
      _HomeState();
}

class _HomeState extends State<Home> {

  final MediaProvider movieProvider = new MediaPrvider();
  final MediaProvider showProvider = new ShowProvider();

  MediaType mediaType = MediaType.movie;
  final TextStyle customTextStyle = TextStyle(
    fontFamily: 'MiFuente',
    fontSize: 16.0,
    fontWeight: FontWeight
        .bold,
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("MovieApp-200749"),
        titleTextStyle: TextStyle(fontFamily: 'MiFuente'),
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(
              Icons.search,
              color: Colors.black26,
            ),
            onPressed: () {
            },
          ),
        ],
      ),
       drawer: new Drawer(
        backgroundColor: Colors.redAccent,
        // Menú lateral (Drawer) que se despliega desde el borde izquierdo
        child: new ListView(children: <Widget>[
          new DrawerHeader(
              child: new Material()), // Encabezado del menú lateral
          new ListTile(
            title: new Text(
              "Peliculas",
              style:
                  customTextStyle,
            ),
            selected: mediaType == MediaType.movie,
            trailing: new Icon(Icons.local_movies),
            onTap: () {
              _changeMediaType(MediaType.movie);
              Navigator.of(context).pop();
            },
          ),
          new Divider(
            height: 5.0,
          ),
          new ListTile(
            title: new Text(
              "Television",
              style:
                  customTextStyle,
            ),
             trailing: new Icon(Icons.live_tv ),
              onTap: () {
              _changeMediaType(MediaType.show);
              Navigator.of(context).pop();
            },
          ),
          new Divider(
            height: 5.0,
          ),
          new ListTile(
            title: new Text(
              "Cerrar",
              style:
                  customTextStyle,
            ),
           trailing: new Icon(Icons.close),
            onTap: () => Navigator.of(context)
                .pop(),
          ),
        ]),
      ),
      body: PageView(children: _getMediaList()),
      bottomNavigationBar: new BottomNavigationBar(
        items: _obtenerIconos(),
      ),
    );
  }

  List<BottomNavigationBarItem> _obtenerIconos() {
    return [
      new BottomNavigationBarItem(
        icon: new Icon(Icons.thumb_up),
        label: ("Populares"),
      ),
      new BottomNavigationBarItem(
        icon: new Icon(Icons.update),
        label: ("Proximamente"),
      ),
      new BottomNavigationBarItem(
        icon: new Icon(Icons.star),
        label: ("Mejor valorados"),
      ),
    ];
  }

  void _changeMediaType(MediaType type) {
    if (mediaType != type) {
      setState(() {
        mediaType = type;
      });
    }
  }

  List<Widget> _getMediaList() {
    return (mediaType == MediaType.movie)
        ? <Widget>[new MediaList(movieProvider)]
        : <Widget>[new MediaList(showProvider)];
  }
}