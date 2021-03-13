class Tag {
  String id;
  String title;

  Tag(this.id, this.title);

  //LÆS OP PÅ DETTE SENERE
  factory Tag.fromJson(dynamic json) {
    return Tag(
      json['id'] as String,
      json['title'] as String,
    );
  }
}
