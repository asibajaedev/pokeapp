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
      child: Stack(children: [
        pokemon == null
            ? Positioned.fill(
                
                child: Opacity(
                  opacity: 0.9,
                  child: Image.asset(
                    'assets/background.png',
                    fit: BoxFit.cover,
                  ),
                ),
              )
            : Positioned.fill(
                right:
                    160, 
                top: 0,
                bottom: 0,
                child: Opacity(
                  opacity: 0.9,
                  child: Image.network(
                    pokemon!.officialArtwork,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary.withOpacity(0.5),
                  Theme.of(context).colorScheme.secondaryContainer,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: pokemon != null
                  ? [
                      Image.network(
                        pokemon?.image ?? '',
                        height: 100,
                        width: 80,
                        fit: BoxFit.contain,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Card(
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondaryContainer,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    6.0), 
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(6.0),
                                        topRight: Radius.circular(6.0),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/pokeball.png',
                                            height: 17,
                                            width: 17,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            pokemon?.number.padLeft(3, '0') ??
                                                '',
                                            style: TextStyle(
                                              fontFamily: 'CustomFont',
                                              fontSize: 9,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 7,
                                          ),
                                          Text(
                                            pokemon?.name ?? '',
                                            style: TextStyle(
                                              fontFamily: 'CustomFont',
                                              fontSize: 9,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            'Height: ${pokemon?.height} m\nWeight: ${pokemon?.weight} kg',
                                            style: TextStyle(
                                              fontFamily: 'CustomFont',
                                              fontSize: 8,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ...pokemon!.types.map((type) {
                                  return Card(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          6.0), 
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        type,
                                        style: TextStyle(
                                          fontFamily: 'CustomFont',
                                          fontSize: 8,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  );
                                })
                              ],
                            )
                          ],
                        ),
                      ),
                    ]
                  : [
                      Expanded(
                        child: Column(
                          children: [
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
                              height: 73,
                              width: 73,
                            ),
                          ],
                        ),
                      ),
                    ],
            ),
          ),
        ),
      ]),
    );
  }
}
