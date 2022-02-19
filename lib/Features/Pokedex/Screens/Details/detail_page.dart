import 'package:flutter/material.dart';
import 'package:pokedex/Features/Pokedex/Screens/Details/detail_app_bar.dart';

import '../../../../Commons/Models/pokemon.dart';

class DetailPage extends StatelessWidget {
  const DetailPage(
      {Key? key,
      required this.pokemon,
      required this.list,
      required this.onBack})
      : super(key: key);

  final Pokemon pokemon;
  final List<Pokemon> list;
  final VoidCallback onBack;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [DetailAppBar(pokemon: pokemon, onBack: onBack)],
      ),
    );
  }
}
