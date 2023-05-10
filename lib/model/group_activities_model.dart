import 'package:app_master_class/model/activity_model.dart';

class GroupActivitiesModel {
  final String name;
  final String description;
  final String imageLink;
  final String repoLink;
  final List<ActivityModel> activities;
  GroupActivitiesModel({
    required this.name,
    required this.description,
    required this.repoLink,
    required this.imageLink,
    required this.activities,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'image-link': imageLink,
      'link': repoLink,
      'activities': activities.map((x) => x.toMap()).toList(),
    };
  }

  factory GroupActivitiesModel.fromMap(Map<String, dynamic> map) {
    final List<ActivityModel> activities =
        (map['activities'] as List<Map<String, dynamic>>)
            .map((activity) => ActivityModel.fromMap(activity))
            .toList();
    return GroupActivitiesModel(
        name: map['name'] as String,
        description: map['description'] as String,
        imageLink: map['image-link'] as String,
        repoLink: map['link'] as String,
        activities: activities);
  }
}
