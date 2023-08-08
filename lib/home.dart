import 'package:flutter/material.dart';

class Recipe {
  String recipeName;
  int recipeTime;
  Image recipeImage;

  Recipe(
      {required this.recipeName,
      required this.recipeTime,
      required this.recipeImage});
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final placeholder = const SizedBox(
    height: 24,
  );

  final placeholder2 = const SizedBox(
    height: 8,
  );

  final List<Recipe> recipes = [
    Recipe(
        recipeName: 'Baguette',
        recipeTime: 30,
        recipeImage: Image.network(
            'https://images.unsplash.com/photo-1599819055803-717bba43890f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80')),
    Recipe(
        recipeName: 'Butter',
        recipeTime: 40,
        recipeImage: Image.network(
            'https://images.unsplash.com/photo-1573812461383-e5f8b759d12e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80')),
    Recipe(
        recipeName: 'Frischkäse',
        recipeTime: 25,
        recipeImage: Image.network(
            'https://images.unsplash.com/photo-1442604699113-7d805614c476?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80')),
    Recipe(
        recipeName: 'Pesto',
        recipeTime: 30,
        recipeImage: Image.network(
            'https://images.unsplash.com/photo-1519623286359-e9f3cbef015b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'Home',
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.list_alt),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            placeholder2,
            Card(
              child: Column(
                children: [
                  Image.network(
                    'https://media.istockphoto.com/id/1170328725/photo/close-up-of-various-food-in-airtight-jars.jpg?s=612x612&w=0&k=20&c=u5tUqbQPbcZ5zvMuRWrLv4VRxRpEBc8zbZpVh5TCqSk=',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  ListTile(
                    title: const Text('Lebenmittel richtig lagern'),
                    subtitle: const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. At purus tellus arcu sit nibh consectetur.',
                    ),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_outline)),
                  ),
                ],
              ),
            ),
            placeholder,
            const Text(
              'Trending',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            placeholder2,
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: recipes.length,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 150,
                    child: Card(
                      child: Column(
                        children: [
                          recipes[index].recipeImage,
                          ListTile(
                            title: Text(recipes[index].recipeName),
                            subtitle: Text('${recipes[index].recipeTime} min'),
                            trailing: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.favorite_outline)),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            placeholder,
            const Text(
              'Trending',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            placeholder2,
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: recipes.length,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 150,
                    child: Card(
                      child: Column(
                        children: [
                          recipes[index].recipeImage,
                          ListTile(
                            title: Text(recipes[index].recipeName),
                            subtitle: Text('${recipes[index].recipeTime} min'),
                            trailing: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.favorite_outline)),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
