import 'dart:convert';
import 'package:http/http.dart' as http;
import 'album.dart';

class Services {
  static const String url =
      "https://api.unsplash.com/photos/?client_id=cf49c08b444ff4cb9e4d126b7e9f7513ba1ee58de7906e4360afc1a33d1bf4c0";

  static Future<List<Album>> getPhotos() async {
    try {
      http.Response response = await http.get(Uri.encodeFull(url));

      if (response.statusCode == 200) {
        List<Album> list = parsePhotos(response.body);
        return list;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<Album> parsePhotos(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<dynamic, dynamic>>();
    return parsed.map<Album>((json) => Album.fromJson(json)).toList();
  }
}
