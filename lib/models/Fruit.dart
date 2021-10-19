import 'package:flutter/material.dart';

class Fruit {
  final int id;
  final String name;
  final String description;
  final AssetImage image; //Precisa ser ajustado para o tipo de imagem recebida do back-end

  Fruit(
      {@required this.id,
      @required this.name,
      @required this.description,
      @required this.image});
}
