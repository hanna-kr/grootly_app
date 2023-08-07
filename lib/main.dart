import 'package:flutter/material.dart';
import 'package:grootly_app/grootly_icons_icons.dart';

void main() {
  runApp(const GrootlyApp());
}

class GrootlyApp extends StatelessWidget {
  const GrootlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grootly App',
      theme: ThemeData(
        primaryColor: const Color(0xFF008868),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class Recipe {
  String recipeName;
  int recipeTime;

  Recipe({required this.recipeName, required this.recipeTime});
}

class MyHomePage extends StatelessWidget {
  final placeholder = const SizedBox(
    height: 24,
  );

  final placeholder2 = const SizedBox(
    height: 8,
  );

  final List<Recipe> recipes = [
    Recipe(recipeName: 'Brown Baguette', recipeTime: 30),
    Recipe(recipeName: 'Brown Baguette', recipeTime: 30),
    Recipe(recipeName: 'Brown Baguette', recipeTime: 30),
    Recipe(recipeName: 'Brown Baguette', recipeTime: 30),
    Recipe(recipeName: 'Brown Baguette', recipeTime: 30),
  ];

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Center(
          child: Text(
            'Grootly',
          ),
        ),
        leading: const Icon(Icons.list_alt),
        actions: const [
          Icon(Icons.person),
          Padding(padding: EdgeInsets.all(8))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: Column(
                children: [
                  Image.network(
                      'https://media.istockphoto.com/id/1170328725/photo/close-up-of-various-food-in-airtight-jars.jpg?s=612x612&w=0&k=20&c=u5tUqbQPbcZ5zvMuRWrLv4VRxRpEBc8zbZpVh5TCqSk='),
                  const ListTile(
                    title: Text('5 easy ways to store food'),
                    subtitle: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. At purus tellus arcu sit nibh consectetur.'),
                    trailing: Icon((Icons.favorite_outline)),
                  ),
                ],
              ),
            ),
            placeholder,
            Text(
              'Trending',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            placeholder2,
            Expanded(
              child: ListView.builder(
                itemCount: recipes.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      leading: Image.network(
                          'https://images.unsplash.com/photo-1599819055803-717bba43890f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80'),
                      title: Text('${recipes[index].recipeName}'),
                      subtitle: Text('${recipes[index].recipeTime} min'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: const Color.fromRGBO(255, 242, 230, 1),
        unselectedItemColor: const Color.fromRGBO(0, 60, 46, 1),
        iconSize: 24,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(GrootlyIcons.home2), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(GrootlyIcons.search2), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(
                GrootlyIcons.chefshat2,
                size: 24,
              ),
              label: 'Recipes'),
          BottomNavigationBarItem(
              icon: Icon(
                GrootlyIcons.sustainablehand,
                size: 24,
              ),
              label: 'Tips')
        ],
      ),
    );
  }
}
