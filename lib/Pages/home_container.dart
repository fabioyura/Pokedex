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
      //Contrutor
      builder: (context, snapshot) {
        // ignore: unrelated_type_equality_checks
        if (snapshot.connectionState.index == ConnectionState.waiting) {
          return const HomeLoading();
        }
        //Se conseguir se conectar, então há data. Logo, ele retorna a HomePage()
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return HomePage(list: snapshot.data!);
        }
        //Se por algum motivo não conseguir se conectar, irá retornar Erro
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
