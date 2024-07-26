import 'package:flutter/material.dart';

class Pokemon {
  String name;
  List<String> abilities;
  String type;
  String image;

  Pokemon({
    required this.name,
    required this.abilities,
    required this.type,
    required this.image,
  });
}

List<Pokemon> pokemonList = [
  Pokemon(
    name: 'Pikachu',
    abilities: ['Static', 'Lightning Rod'],
    type: 'Electric',
    image:
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png',
  ),
  Pokemon(
    name: 'Charizard',
    abilities: ['Blaze', 'Solar Power'],
    type: 'Fire',
    image:
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/6.png',
  ),
  Pokemon(
    name: 'Charizard',
    abilities: ['Blaze', 'Solar Power'],
    type: 'Fire',
    image:
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/6.png',
  ),
  Pokemon(
    name: 'Charizard',
    abilities: ['Blaze', 'Solar Power'],
    type: 'Fire',
    image:
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/6.png',
  ),
  Pokemon(
    name: 'Charizard',
    abilities: ['Blaze', 'Solar Power'],
    type: 'Fire',
    image:
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/6.png',
  ),
  Pokemon(
    name: 'Charizard',
    abilities: ['Blaze', 'Solar Power'],
    type: 'Fire',
    image:
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/6.png',
  ),
  // Add more Pokemon here
];

class Encyclopedia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: LayoutBuilder(
          builder: (context, constraints) {
            int crossAxisCount = (constraints.maxWidth / 200).floor();

            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: pokemonList.length,
              itemBuilder: (context, index) {
                final pokemon = pokemonList[index];
                return HoverCard(pokemon: pokemon);
              },
            );
          },
        ));
  }
}

class HoverCard extends StatefulWidget {
  const HoverCard({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        transform: _isHovered ? (Matrix4.identity()..scale(1.0, 1.04)) : Matrix4.identity(),
        decoration: BoxDecoration(
          border: Border.all(
            color: _isHovered ?Theme.of(context).colorScheme.primary : Colors.transparent,
            width: 5,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Card(
          margin: EdgeInsets.zero,
          elevation: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Image.network(
                  widget.pokemon.image,
                  height: 100,
                  width: 100,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 10),
              Text(
                widget.pokemon.name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text('Type: ${widget.pokemon.type}'),
              SizedBox(height: 5),
              Text('Abilities: ${widget.pokemon.abilities.join(', ')}'),
              SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}
