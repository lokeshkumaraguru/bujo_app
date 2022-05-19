import 'package:flutter/cupertino.dart';

import '../utils.dart';

class BujoField {
  static const createdTime = 'createdTime';
}

class Bujo {
  DateTime createdTime;
  String title;
  String id;
  String description;
  bool isDone;

  Bujo({
    required this.createdTime,
    required this.title,
    this.description = "",
    this.id = "",
    this.isDone = false,
});

  static Bujo fromJson(Map<String, dynamic> json) => Bujo(
    createdTime: Utils.toDateTime(json['createdTime']),
    title: json['title'],
    description: json['description'],
    id: json['id'],
    isDone: json['isDone'],
  );

  Map<String, dynamic> toJson() => {
    'createdTime':Utils.fromDateTimeToJson(createdTime),
    'title':title,
    'description':description,
    'id':id,
    'isDone':isDone,
  };
}



// import 'package:flutter/material.dart';
/*
class BujoField {
  static const createdTime = 'createdTime';
}

class Bujo {
  late DateTime createdTime;
  late String id;
  late String title;
  String description = '';
  bool isDone = false;

  Bujo({
    required this.createdTime,
    required this.title,
    this.description = '',
    this.id = '',
    this.isDone = false,
  });

}
 */