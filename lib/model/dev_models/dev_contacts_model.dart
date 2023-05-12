class DevContactsModel {
  String name;
  String iconLink;
  String link;
  DevContactsModel(
      {required this.iconLink, required this.link, required this.name});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'iconLink': iconLink,
      'link': link,
    };
  }

  factory DevContactsModel.fromMap(Map<String, dynamic> map) {
    return DevContactsModel(
      name: map['name'] as String,
      iconLink: map['iconLink'] as String,
      link: map['link'] as String,
    );
  }
}
