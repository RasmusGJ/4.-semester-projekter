import 'package:first_project/models/Party/image.dart';

class Party {
  String id;
  String name;
  String age;
  String chairman;
  String bloc;
  String numberofcandidates;
  String partydescription;
  Image images;

  Party(this.id, this.name, this.age, this.chairman, this.bloc,
      this.numberofcandidates, this.partydescription, this.images);

  //LÆS OP PÅ DETTE SENERE LOL
  factory Party.fromJson(dynamic json) {
    return Party(
      json['_id'] as String,
      json['name'] as String,
      json['age'] as String,
      json['chairman'] as String,
      json['bloc'] as String,
      json['numberofcandidates'] as String,
      json['partydescription'] as String,
      Image.fromJson(json["image"]),
    );
  }
}
