import 'dart:convert';

class Album {
  String id;
  String thumb;
  String title;
  String username;

  Album({this.id, this.title, this.thumb, this.username});

  factory Album.fromJson(Map<dynamic, dynamic> json) {
    return Album(
        id: json['id'] as String,
        thumb: json['urls']['thumb'] as String,
        title: json['alt_description'] as String,
        username: json['user']['username'] as String);
  }
}
