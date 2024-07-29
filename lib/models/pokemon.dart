class Pokemon {
  final String number;
  final String name;
  final String image;

  Pokemon({
    required this.number,
    required this.name,
    required this.image,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      number: json['id'].toString(),
      name: json['name'] ?? 'Unknown',
      image: json['sprites']['front_default'] ?? '',
    );
  }
}