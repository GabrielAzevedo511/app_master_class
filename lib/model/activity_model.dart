import 'package:flutter/material.dart';

class ActivityModel {
  final String name;
  final String key;
  final Color difficult;
  final String link;
  ActivityModel(
      {required this.name,
      required this.key,
      required this.difficult,
      required this.link});

  Map<String, dynamic> toMap() {
    List<int> color = [difficult.red, difficult.green, difficult.blue];
    return <String, dynamic>{
      'name': name,
      'key': key,
      'difficult': color,
      'link': link,
    };
  }

  factory ActivityModel.fromMap(Map<String, dynamic> map) {
    final List<int> colorRGB = List<int>.from(map['dificult']);
    return ActivityModel(
        name: map['name'] as String,
        key: map['key'] as String,
        difficult: Color.fromARGB(255, colorRGB[0], colorRGB[1], colorRGB[2]),
        link: map['link']);
  }
}
