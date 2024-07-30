import 'package:flutter/material.dart';
import 'package:pokeapp/models/pokemon.dart';

class HoverCard extends StatefulWidget {
  const HoverCard({
    super.key,
    required this.pokemon,
    required this.onSelectPokemon,
  });

  final Pokemon pokemon;
  final Function(Pokemon) onSelectPokemon;

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    var pokemonNumber = widget.pokemon.number.padLeft(3, '0');

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        transform: _isHovered
            ? (Matrix4.identity()..scale(1.0, 1.04))
            : Matrix4.identity(),
        decoration: BoxDecoration(
          border: Border.all(
            color: _isHovered
                ? Theme.of(context).colorScheme.secondary
                : Colors.transparent,
            width: 5,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: InkWell(
          onTap: () {
            widget.onSelectPokemon(widget.pokemon);
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(6.0), 
            ),
            margin: EdgeInsets.zero,
            elevation: 5,
            color: Theme.of(context).colorScheme.secondaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/pokeball.png',
                        height: 17,
                        width: 17,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                          textAlign: TextAlign.left,
                          '$pokemonNumber  \n${widget.pokemon.name}',
                          style: TextStyle(
                            fontFamily: 'CustomFont',
                            fontSize: 8,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: Image.network(
                      widget.pokemon.image,
                      height: 100,
                      width: 100,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
