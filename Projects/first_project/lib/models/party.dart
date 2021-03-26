class Party {
  String id;
  String name;
  String age;
  String chairman;
  String bloc;
  String numberofcandidates;
  String partydescription;
  String image;

  Party(this.id, this.name, this.age, this.chairman, this.bloc,
      this.numberofcandidates, this.partydescription, this.image);

  //LÆS OP PÅ DETTE SENERE LOL
  factory Party.fromJson(dynamic json) {
    return Party(
        json['id'] as String,
        json['name'] as String,
        json['age'] as String,
        json['chairman'] as String,
        json['bloc'] as String,
        json['numberofcandidates'] as String,
        json['partydescription'] as String,
        json['image'] as String);
  }
}
