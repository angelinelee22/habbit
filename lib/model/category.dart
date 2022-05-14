import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:habbit/utils/uuid.dart';

@JsonSerializable()
class Category {
  String id;
  String title;
  int? uid;

  Category(
    this.title, {
    String? id,
  }) : this.id = id ?? Uuid().generateV4();
}
