import 'package:first_project/models/cv.dart';
import 'package:first_project/models/party.dart';
//import 'package:first_project/models/keyIssue.dart';

class Candidate {
  String id;
  String name;
  String age;
  String county;
  String education;
  String profession;
  String mail;
  String image;
  List<CV> cvs;
  String partyId;
  Party party;
  //List<KeyIssues> keyIssues;

  Candidate(
      {this.id,
      this.name,
      this.age,
      this.county,
      this.education,
      this.profession,
      this.mail,
      this.image,
      this.cvs,
      this.partyId,
      this.party
      //this.keyIssues,
      });

  //LÆS OP PÅ DETTE SENERE
  factory Candidate.fromJson(dynamic json) {
    var list1 = json['cvs'] as List;
    //var list2 = json['keyIssues'] as List;

    List<CV> cvList = list1.map((i) => CV.fromJson(i)).toList();
    //List<KeyIssues> keyList = list2.map((i) => KeyIssues.fromJson(i)).toList();

    return Candidate(
        id: json['_id'] as String,
        name: json['name'] as String,
        age: json['age'] as String,
        county: json['county'] as String,
        education: json['education'] as String,
        profession: json['profession'] as String,
        mail: json['mail'] as String,
        image: json['image'] as String,
        cvs: cvList,
        partyId: json['party'] as String
        //keyIssues: keyList,
        );
  }
}
