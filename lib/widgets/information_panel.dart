import 'package:flutter/material.dart';
import '../models/pokemon.dart';

class InformationPanel extends StatelessWidget {
  final double width;
  final Pokemon? pokemon;

  InformationPanel({
    required this.width,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.secondaryContainer,
      width: width,
      margin: EdgeInsets.only(bottom: 15),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: pokemon != null
              ? [
                  Text(
                    pokemon?.name ?? '',
                    style: TextStyle(
                      fontFamily: 'CustomFont',
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Image.network(
                    pokemon?.image ?? '',
                    height: 100,
                    width: 100,
                  ),
                ]
              : [
                  Text(
                    'POKEAPP',
                    style: TextStyle(
                      fontFamily: 'CustomFont',
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Image.asset(
                    'assets/pokeball.png',
                    height: 100,
                    width: 100,
                  ),
                ],
        ),
      ),
    );
  }
}
