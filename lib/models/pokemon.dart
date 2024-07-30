class Pokemon {
  final String number;
  final String name;
  final String image;
  final List<String> types;
  final double height;
  final double weight;
  final String officialArtwork;

  Pokemon({
    required this.number,
    required this.name,
    required this.image,
    required this.types,
    required this.height,
    required this.weight,
    required this.officialArtwork,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) { 
    return Pokemon(
      number: json['id'].toString(),
      name: json['name'] ?? 'Unknown',
      image: json['sprites']['front_default'] ?? '', 
      types: (json['types'] as List<dynamic>)
          .map<String>((type) => type['type']['name'])
          .toList(),
      height: json['height'] / 10,
      weight: json['weight'] / 10,
      officialArtwork: json['sprites']['other']['official-artwork']['front_default'] ?? '',
    );
  }
}