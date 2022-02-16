class Pokemon {
  final int id;
  final String num;
  final String name;
  final String img;
  final List<String> type;

  //Em um construtor nomeado padrão ele lê os dados mas não precisa retornar nenhum valor. Por isso então, usaremos o construtor do tipo Factory, para retornar a classe Pokemon
  factory Pokemon.fromMap(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      num: json['num'],
      name: json['name'],
      img: json['img'],
      type: (json['type'] as List<dynamic>)
          .map((e) => e as String)
          .toList(), //Desta forma, ele pega o texto que está dentro do type e o transforma em uma lista
    );
  }

  Pokemon(
      {required this.id,
      required this.num,
      required this.name,
      required this.img,
      required this.type});
}
