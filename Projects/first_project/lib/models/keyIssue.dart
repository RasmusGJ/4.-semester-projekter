import 'package:first_project/models/tag.dart';

class KeyIssues {
  String id;
  String title;
  String description;
  List<Tag> tags;

  KeyIssues({this.id, this.title, this.description, this.tags});

  //LÆS OP PÅ DETTE SENERE
  factory KeyIssues.fromJson(dynamic json) {
    var list = json['tags'] as List;
    List<Tag> tagsList = list.map((i) => Tag.fromJson(i)).toList();

    return KeyIssues(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      tags: tagsList,
    );
  }
}
