// Creado por: Marco Antonio Rosas Gonzalez
// Asignatura: Desarrollo Movil Integral
//Grado: 10   Grupo: "A"
// Docente: MTI. Marco Antonio Ramirez Hernandez
import 'dart:async'; // Importa la biblioteca para manejar operaciones asíncronas.
import 'dart:convert'; // Importa la biblioteca para codificar y decodificar JSON.
import 'package:http/http.dart' as http; // Importa la biblioteca para realizar solicitudes HTTP.
import 'package:movieapp_200749/common/Constants.dart'; // Importa un archivo Constants.dart.
import 'package:movieapp_200749/model/Media.dart'; // Importa la definición de la clase Media.

class HttpHandler {
  static final _httHandler = new HttpHandler();
  final String _baseUrl = "api.themoviedb.org";
  final String _language =
      "es-MX";

  static HttpHandler get(){
    return _httHandler;
  }

  Future<dynamic> getJson(Uri uri) async {
    http.Response response =
        await http.get(uri);
    return json.decode(response.body);
  }
  Future<List<Media>> fetchMovies() {
    var uri = new Uri.https(
        _baseUrl,
        "3/movie/popular",
        {
          'api_key': API_KEY,
          'page': "1",
          'languaje': _language
        });
    return getJson(uri).then(((data) =>
        data['results'].map<Media>((item) => new Media(item, MediaType.movie)).toList()));
  }
  Future<List<Media>> fetchShow() {
    var uri = new Uri.https(
        _baseUrl,
        "3/tv/popular", 
        {
          'api_key': API_KEY,
          'page': "1",
          'languaje': _language
        });
    return getJson(uri).then(((data) =>
        data['results'].map<Media>((item) => new Media(item, MediaType.show)).toList()));
  }
}