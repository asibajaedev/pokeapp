import 'package:flutter/material.dart';
import 'package:pokeapp/models/pokemon.dart';
import 'package:pokeapp/services/pokemon_get.dart';
import 'pokemon_card.dart';
import 'information_panel.dart';

class Encyclopedia extends StatefulWidget {
  @override
  State<Encyclopedia> createState() => _EncyclopediaState();
}

class _EncyclopediaState extends State<Encyclopedia> {
  final ScrollController _scrollController = ScrollController();
  final List<Pokemon> _pokemonList = [];
  final PokemonGet _getPoke =
      PokemonGet(baseUrl: 'https://pokeapi.co/api/v2/pokemon');
  bool _isLoading = false;
  bool _hasMore = true;
  int _itemsPerPage = 20;
  Pokemon? _pokemonSelected;

  void _updatePokemon(Pokemon currentPokemon) {
    setState(() {
      _pokemonSelected = currentPokemon;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadMorePokemons();

    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        bool isTop = _scrollController.position.pixels == 0;
        if (!isTop && _hasMore && !_isLoading) {
          _loadMorePokemons();
        }
      }
    });
  }

  Future<void> _loadMorePokemons() async {
    setState(() {
      _isLoading = true;
    });

    try {
      List<Pokemon> newPokemons = await _getPoke.fetchPokemons(limitOverride: _itemsPerPage);
      setState(() {
        _pokemonList.addAll(newPokemons);
        _hasMore = newPokemons.isNotEmpty;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Padding(
        padding: const EdgeInsets.all(20),
        child: LayoutBuilder(
          builder: (context, constraints) {
            int crossAxisCount = (constraints.maxWidth / 200).floor() + 1;            
            int rowCount = (constraints.maxHeight / 200).floor() + 1;          
            _itemsPerPage = crossAxisCount * rowCount;
            return Column(
              children: [
                SafeArea(child: InformationPanel(width: constraints.maxWidth, pokemon: _pokemonSelected),), 
                Divider(
                  color: Theme.of(context).colorScheme.secondary,
                  thickness: 5,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 15),                    
                    child: GridView.builder(     
                      padding: EdgeInsets.zero,         
                      controller: _scrollController,                    
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: _pokemonList.length + (_hasMore ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index < _pokemonList.length) {                  
                          final pokemon = _pokemonList[index];
                          return HoverCard(
                            onSelectPokemon: _updatePokemon, 
                            pokemon: pokemon);
                        } else {
                          return Center(child: CircularProgressIndicator());                 
                        }
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ));
  }
}

