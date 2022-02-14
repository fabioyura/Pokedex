import 'package:flutter/material.dart';
import 'package:pokedex/Commons/Repositories/pokemon_repository.dart';
import 'package:pokedex/Pages/home_container.dart';

class PokedexRoute extends StatelessWidget {
  final PokemonRepository repository;
  const PokedexRoute({Key? key, required this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {}
        return MaterialPageRoute(builder: (context) {
          return HomeContainer(repository: repository);
        });
      },
    );
  }
}
