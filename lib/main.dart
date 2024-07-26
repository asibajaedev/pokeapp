import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import the necessary package
import 'encyclopedia.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider( // Define the ChangeNotifierProvider method
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        ),
        home: MyHomePage(title: 'PokeApp'),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  
}

class MyHomePage extends StatefulWidget {
  final String title;
  
  const MyHomePage({Key? key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    Widget page;
    var selectedIndex = 0;

    switch (selectedIndex) {
      case 0:
        page = Encyclopedia();
        break;
      case 1:
        page = Placeholder();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return Scaffold(
      body: Row(
        children: [
          SafeArea(
            child: NavigationRail(
              selectedIndex: selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.favorite_border),
                  selectedIcon: Icon(Icons.favorite),
                  label: Text('Favorites'),
                ), 
                NavigationRailDestination(
                  icon: Icon(Icons.bookmark_border),
                  selectedIcon: Icon(Icons.bookmark),
                  label: Text('History'),
                ),          
              ],  
            )
          ),
          Expanded(
            child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
          ),
        ],
      ),
    );
  }
}
