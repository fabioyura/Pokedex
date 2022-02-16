import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/Commons/Repositories/pokemon_repository.dart';
import 'package:pokedex/Pages/Details/detail_container.dart';
import 'package:pokedex/Pages/Home/home_container.dart';

class PokedexRoute extends StatelessWidget {
  final PokemonRepository repository;
  const PokedexRoute({Key? key, required this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(
            builder: (context) {
              return HomeContainer(
                repository: PokemonRepository(dio: Dio()),
                onItemTap: (route, arguments) {
                  Navigator.of(context).pushNamed(route, arguments: arguments);
                },
              );
            },
          );
        }

        if (settings.name == '/details') {
          return MaterialPageRoute(builder: (context) {
            return DetailContainer(
                repository: repository,
                arguments: (settings.arguments as DetailArguments));
          });
        }
      },
    );
  }
}
