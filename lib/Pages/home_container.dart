//Método Future
import 'package:flutter/material.dart';
import 'package:pokedex/Commons/Error/failure.dart';
import 'package:pokedex/Commons/Repositories/pokemon_repository.dart';
import 'package:pokedex/Models/pokemon.dart';
import 'Home/home_loading.dart';
import 'Home/home_page.dart';
import 'home_error.dart';

class HomeContainer extends StatelessWidget {
  final InterfacePokemonRepository repository;

  const HomeContainer({Key? key, required this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: repository.getAllPokemons(),
      builder: (context, snapshot) {
        if (snapshot.connectionState.index == ConnectionState.waiting) {
          return HomeLoading();
        }

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return HomePage(list: snapshot.data!);
        }

        if (snapshot.hasError) {
          return HomeError(
            error: (snapshot.error as Failure).message!,
          );
        }

        return Container();
      },
    );
  }
}
