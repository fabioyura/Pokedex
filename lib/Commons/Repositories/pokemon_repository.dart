import 'dart:convert';

import 'package:pokedex/Commons/Consts/api_consts.dart';
import 'package:pokedex/Commons/Error/failure.dart';
import 'package:dio/dio.dart';
import 'package:pokedex/Commons/Models/pokemon.dart';

abstract class InterfacePokemonRepository {
  Future<List<Pokemon>>
      getAllPokemons(); //Método que será invocado dentro do HomeContainer
}

class PokemonRepository implements InterfacePokemonRepository {
  final Dio dio;

  PokemonRepository({required this.dio});
  //Aqui é onde começa o método Future

  @override
  Future<List<Pokemon>> getAllPokemons() async {
    //Para usar o método Future, é necessário que seja assíncrona.
    try {
      //Logo, teremos o await para esperar o retorno da função
      final response = await dio.get(ApiConsts.allPokemonsURL);
      //Nossa API está no formato json. Então precisamos converte-la para a nossa classe Pokémon
      final json = jsonDecode(response.data)
          as Map<String, dynamic>; //O jsonDecode converte para um MAP<>
      final list = json['pokemon']
          as List<dynamic>; //Classe json 'Pokemon' importada da API

      return list.map((e) => Pokemon.fromMap(e)).toList();
    } catch (e) {
      throw Failure('Não foi possível carregar os dados');
    }
  }
}
