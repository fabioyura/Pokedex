import 'package:flutter/material.dart';
import 'package:pokedex/Commons/Error/failure.dart';
import '../../Components/Widgets/error_widget.dart';
import 'package:pokedex/Commons/Repositories/pokemon_repository.dart';
import 'package:pokedex/Components/Widgets/loading_widget.dart';
import 'package:pokedex/Pages/Details/detail_page.dart';
import '../../Components/Models/pokemon.dart';

class DetailArguments {
  DetailArguments({required this.name});
  final String name;
}

class DetailContainer extends StatelessWidget {
  const DetailContainer(
      {Key? key, required this.arguments, required this.repository})
      : super(key: key);
  final InterfacePokemonRepository repository;
  final DetailArguments arguments;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: repository.getAllPokemons(),
      builder: (context, snapshot) {
        // ignore: unrelated_type_equality_checks
        if (snapshot.connectionState.index == ConnectionState.waiting) {
          return const LoadingWidget();
        }
        //Se conseguir se conectar, então há data. Logo, ele retorna a HomePage()
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return DetailPage(name: arguments.name, list: snapshot.data!);
        }
        //Se por algum motivo não conseguir se conectar, irá retornar Erro
        if (snapshot.hasError) {
          return Error(
            error: (snapshot.error as Failure).message!,
          );
        }

        return Container();
      },
    );
  }
}
