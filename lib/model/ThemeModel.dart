import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';

part 'ThemeModel.g.dart';

@JsonSerializable()
class ThemeModel {
  final String themeData;
  static Map<String, ThemeData> map = {
    "dark": ThemeData.dark(),
    "blue": ThemeData.light(),
    "purple": new ThemeData(primarySwatch: Colors.purple),
    "pink": new ThemeData(primarySwatch: Colors.pink),
    "red": new ThemeData(primarySwatch: Colors.red),
    "orange": new ThemeData(primarySwatch: Colors.orange),
    "amber": new ThemeData(primarySwatch: Colors.amber),
    "lime": new ThemeData(primarySwatch: Colors.lime),
    "green": new ThemeData(primarySwatch: Colors.green),
    "teal": new ThemeData(primarySwatch: Colors.teal),
    "cyan": new ThemeData(primarySwatch: Colors.cyan),
    "yellow": new ThemeData(primarySwatch: Colors.yellow),
    "deepPurple": new ThemeData(primarySwatch: Colors.deepPurple),
  };

  ThemeModel(this.themeData);

  factory ThemeModel.fromJson(Map<String, dynamic> json) =>
      _$ThemeModelFromJson(json);

  Map<String, dynamic> toJson() => _$ThemeModelToJson(this);
}
