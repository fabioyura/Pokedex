import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/Commons/Repositories/pokemon_repository.dart';
import 'package:pokedex/Features/Pokedex/Screens/Details/detail_container.dart';
import 'package:pokedex/Features/Pokedex/Screens/Home/Container/home_container.dart';

class PokedexRoute extends StatelessWidget {
  const PokedexRoute({Key? key, required this.repository}) : super(key: key);

  final PokemonRepository repository;

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
              arguments: (settings.arguments as DetailArguments),
              onBack: () => Navigator.of(context).pop(),
            );
          });
        }
        return null;
      },
    );
  }
}
