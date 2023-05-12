import 'package:app_master_class/model/dev_models/dev_contacts_model.dart';
import 'package:app_master_class/model/dev_models/dev_technologies_model.dart';

class DevModel {
  String name;
  String imageLink;
  String description;
  List<DevContactsModel> contacts;
  List<DevTechnologiesModel> technologies;
  DevModel({
    required this.name,
    required this.imageLink,
    required this.description,
    required this.contacts,
    required this.technologies,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'imageLink': imageLink,
      'description': description,
      'contacts': contacts.map((contact) => contact.toMap()).toList(),
      'technologies':
          technologies.map((technology) => technology.toMap()).toList(),
    };
  }

  factory DevModel.fromMap(Map<String, dynamic> map) {
    final List<DevContactsModel> contacts =
        (map['contacts'] as List<Map<String, dynamic>>)
            .map((contact) => DevContactsModel.fromMap(contact))
            .toList();
    final List<DevTechnologiesModel> technologies =
        (map['technologies'] as List<Map<String, dynamic>>)
            .map((technology) => DevTechnologiesModel.fromMap(technology))
            .toList();
    return DevModel(
      name: map['name'] as String,
      imageLink: map['imageLink'] as String,
      description: map['description'] as String,
      contacts: contacts,
      technologies: technologies,
    );
  }

  List<DevTechnologiesModel> getFavoriteTechnologies() {
    final List<DevTechnologiesModel> newList = technologies.toList();
    newList.removeWhere((technology) => !technology.isFavorite);
    return newList;
  }
}
