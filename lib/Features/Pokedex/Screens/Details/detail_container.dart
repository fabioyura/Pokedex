import 'package:flutter/material.dart';
import 'package:pokedex/Commons/Error/failure.dart';
import 'package:pokedex/Commons/Repositories/pokemon_repository.dart';
import 'package:pokedex/Commons/Widgets/po_error.dart';
import 'package:pokedex/Commons/Widgets/po_loading.dart';
import 'package:pokedex/Features/Pokedex/Screens/Details/detail_page.dart';
import '../../../../Commons/Models/pokemon.dart';

class DetailArguments {
  DetailArguments({required this.pokemon});
  final Pokemon pokemon;
}

class DetailContainer extends StatelessWidget {
  const DetailContainer(
      {Key? key,
      required this.arguments,
      required this.repository,
      required this.onBack})
      : super(key: key);

  final InterfacePokemonRepository repository;
  final DetailArguments arguments;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: repository.getAllPokemons(),
      builder: (context, snapshot) {
        // ignore: unrelated_type_equality_checks
        if (snapshot.connectionState.index == ConnectionState.waiting) {
          return const PoLoading();
        }
        //Se conseguir se conectar, então há data. Logo, ele retorna a HomePage()
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return DetailPage(
            pokemon: arguments.pokemon,
            list: snapshot.data!,
            onBack: onBack,
          );
        }
        //Se por algum motivo não conseguir se conectar, irá retornar Erro
        if (snapshot.hasError) {
          return PoError(
            error: (snapshot.error as Failure).message!,
          );
        }

        return Container();
      },
    );
  }
}
