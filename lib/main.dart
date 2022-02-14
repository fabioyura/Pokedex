import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/Commons/Repositories/pokemon_repository.dart';
import 'package:pokedex/Pages/home_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomeContainer(
        repository: PokemonRepository(
          dio: Dio(),
        ),
      ),
    );
  }
}
