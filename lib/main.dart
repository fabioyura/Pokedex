import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/Commons/Repositories/pokemon_repository.dart';
import 'package:pokedex/Features/Pokedex/pokedex_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: PokedexRoute(
        repository: PokemonRepository(
          dio: Dio(),
        ),
      ),
    );
  }
}
