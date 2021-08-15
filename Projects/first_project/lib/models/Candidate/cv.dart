class CV {
  String id;
  String title;
  String description;
  String fromDate;
  String toDate;
  String type;
  String createdAt;
  String updatedAt;

  CV(this.id, this.title, this.description, this.fromDate, this.toDate,
      this.type, this.createdAt, this.updatedAt);

  //LÆS OP PÅ DETTE SENERE
  factory CV.fromJson(dynamic json) {
    return CV(
      json['_id'] as String,
      json['title'] as String,
      json['description'] as String,
      json['fromdate'] as String,
      json['todate'] as String,
      json['type'] as String,
      json['createdAt'] as String,
      json['updatedAt'] as String,
    );
  }
}
