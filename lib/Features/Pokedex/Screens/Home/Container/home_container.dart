import 'package:flutter/material.dart';
import 'package:pokedex/Commons/Error/failure.dart';
import 'package:pokedex/Commons/Repositories/pokemon_repository.dart';
import 'package:pokedex/Commons/Models/pokemon.dart';
import 'package:pokedex/Commons/Widgets/po_error.dart';
import '../../Details/detail_container.dart';
import '../Pages/home_loading.dart';
import '../Pages/home_page.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer(
      {Key? key, required this.repository, required this.onItemTap})
      : super(key: key);

  final InterfacePokemonRepository repository;

  final Function(String, DetailArguments) onItemTap;

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
          return HomePage(list: snapshot.data!, onItemTap: onItemTap);
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

//Neste caso em especific
