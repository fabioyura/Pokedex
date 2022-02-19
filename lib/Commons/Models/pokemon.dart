import 'package:flutter/material.dart';

class Pokemon {
  final int id;
  final String num;
  final String name;
  final String img;
  final List<String> type;

  //Em um construtor nomeado padrão ele lê os dados mas não precisa retornar nenhum valor. Por isso então, usaremos o construtor do tipo Factory, para retornar a classe Pokemon
  factory Pokemon.fromMap(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      num: json['num'],
      name: json['name'],
      img: json['img'],
      type: (json['type'] as List<dynamic>)
          .map((e) => e as String)
          .toList(), //Desta forma, ele pega o texto que está dentro do type e o transforma em uma lista
    );
  }

  Color? get baseColor => _color(type: type[0]);

  Pokemon(
      {required this.id,
      required this.num,
      required this.name,
      required this.img,
      required this.type});
}

Color? _color({required String type}) {
  switch (type) {
    case 'Normal':
      return Colors.brown[400];
    case 'Fire':
      return Colors.red;
    case 'Water':
      return Colors.blue;
    case 'Grass':
      return Colors.green;
    case 'Electric':
      return Colors.amber;
    case 'Ice':
      return Colors.cyanAccent[400];
    case 'Fighting':
      return Colors.orange;
    case 'Poison':
      return Colors.purple;
    case 'Ground':
      return Colors.orange[300];
    case 'Flying':
      return Colors.indigo[200];
    case 'Psychic':
      return Colors.pink;
    case 'Bug':
      return Colors.lightGreen[500];
    case 'Rock':
      return Colors.grey;
    case 'Ghost':
      return Colors.indigo[400];
    case 'Dark':
      return Colors.brown;
    case 'Dragon':
      return Colors.indigo[800];
    case 'Steel':
      return Colors.blueGrey;
    case 'Fairy':
      return Colors.pinkAccent[100];
    default:
      return Colors.grey;
  }
}
