// import 'package:flutter/material.dart';

// class BigImageCard extends StatelessWidget {
//   const BigImageCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//                 child: Column(
//                   children: [
//                     Image.network(
//                       'https://media.istockphoto.com/id/1170328725/photo/close-up-of-various-food-in-airtight-jars.jpg?s=612x612&w=0&k=20&c=u5tUqbQPbcZ5zvMuRWrLv4VRxRpEBc8zbZpVh5TCqSk=',
//                       height: 200,
//                       width: double.infinity,
//                       fit: BoxFit.cover,
//                     ),
//                     ListTile(
//                       title: const Text(
//                         'Lebenmittel richtig lagern',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       subtitle: const Text(
//                         'Lorem ipsum dolor sit amet, consectetur adipiscing elit. At purus tellus arcu sit nibh consectetur.',
//                         style: TextStyle(color: Colors.grey),
//                       ),
//                       trailing: IconButton(
//                           onPressed: () {},
//                           icon: const Icon(Icons.favorite_outline)),
//                     ),
//                   ],
//                 ),
//               );
//   }
// }

import 'package:flutter/material.dart';

class BigImageCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  const BigImageCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(
            imageUrl,
            height: 220,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          ListTile(
            title: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              subtitle,
              style: const TextStyle(color: Colors.grey),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_outline),
            ),
          ),
        ],
      ),
    );
  }
}
