class Tips {
  String description;
  String imgURL;
  String title;
  String? extra;
  String subtitle;

  Tips(
      {required this.description,
      required this.imgURL,
      required this.title,
      this.extra,
      required this.subtitle});

  factory Tips.fromJson(Map<String, dynamic> json) {
    return Tips(
        description: json['description'],
        imgURL: json['imgURL'],
        title: json['title'],
        extra: json['extra'],
        subtitle: json['subtitle']);
  }
}
