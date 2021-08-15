import 'package:first_project/models/Candidate/tag.dart';

class KeyIssue {
  String id;
  String title;
  String description;
  String tagId;
  Tag tag;

  KeyIssue({this.id, this.title, this.description, this.tagId});

  //LÆS OP PÅ DETTE SENERE
  factory KeyIssue.fromJson(dynamic json) {
    return KeyIssue(
      id: json['_id'] as String,
      tagId: json['tag'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
    );
  }
}
