class DevTechnologiesModel {
  String name;
  String iconLink;
  int ability;
  bool isFavorite;
  DevTechnologiesModel({
    required this.name,
    required this.iconLink,
    required this.ability,
    required this.isFavorite,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'iconLink': iconLink,
      'ability': ability,
      'isFavorite': isFavorite,
    };
  }

  factory DevTechnologiesModel.fromMap(Map<String, dynamic> map) {
    return DevTechnologiesModel(
      name: map['name'] as String,
      iconLink: map['iconLink'] as String,
      ability: map['ability'] as int,
      isFavorite: map['isFavorite'] as bool,
    );
  }
}
