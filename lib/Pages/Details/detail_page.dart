import 'package:flutter/material.dart';

import '../../Components/Models/pokemon.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.name, required this.list})
      : super(key: key);

  final String name;
  final List<Pokemon> list;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(
                height: 400,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                ))
          ],
        ),
      ),
    );
  }
}
