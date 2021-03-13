import 'package:first_project/models/cv.dart';
import 'package:first_project/models/keyIssue.dart';

class Candidate {
  String id;
  String name;
  String county;
  String education;
  String mail;
  String image;
  List<CV> cvs;
  //List<KeyIssues> keyIssues;

  Candidate({
    this.id,
    this.name,
    this.county,
    this.education,
    this.mail,
    this.image,
    this.cvs,
    //this.keyIssues,
  });

  //LÆS OP PÅ DETTE SENERE
  factory Candidate.fromJson(dynamic json) {
    var list1 = json['cvs'] as List;
    //var list2 = json['keyIssues'] as List;

    List<CV> cvList = list1.map((i) => CV.fromJson(i)).toList();
    //List<KeyIssues> keyList = list2.map((i) => KeyIssues.fromJson(i)).toList();

    return Candidate(
      id: json['id'] as String,
      name: json['name'] as String,
      county: json['county'] as String,
      education: json['education'] as String,
      mail: json['mail'] as String,
      image: json['image'] as String,
      cvs: cvList,
      //keyIssues: keyList,
    );
  }
}
