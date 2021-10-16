import 'package:flutter/material.dart';

class Fruit {
  final String id;
  final String name;
  final String description;
  final NetworkImage image;

  Fruit(
      {@required this.id,
      @required this.name,
      @required this.description,
      @required this.image});
}
