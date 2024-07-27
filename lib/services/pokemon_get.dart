import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/pokemon.dart';

class PokemonGet {
  final String baseUrl;
  int offset;
  final int limit;

  PokemonGet({
    required this.baseUrl,
    this.offset = 0,
    this.limit = 20,
  });

  Future <List<Pokemon>> fetchPokemons() async {
    final response = await http.get(Uri.parse('$baseUrl?offset=$offset&limit=$limit'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      List<dynamic> results = data['results'];

      List<Pokemon> pokemons = [];
      for (var result in results) {
        final pokemonResponse = await http.get(Uri.parse(result['url']));
        if (pokemonResponse.statusCode == 200) {
          var pokemonData = jsonDecode(pokemonResponse.body);
          pokemons.add(Pokemon.fromJson(pokemonData));
        }
      }

      offset += limit;

      return pokemons;
    } else {
      throw Exception('Error al cargar los Pokémon');
    }
  }
}