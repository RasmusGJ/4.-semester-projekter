class Image {
  String mini;
  String profile;
  String banner;

  Image(this.mini, this.profile, this.banner);

  //LÆS OP PÅ DETTE SENERE LOL
  factory Image.fromJson(dynamic json) {
    return Image(
      json['mini'] as String,
      json['profile'] as String,
      json['banner'] as String,
    );
  }
}
