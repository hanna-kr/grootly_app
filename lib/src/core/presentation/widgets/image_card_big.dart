import 'package:flutter/material.dart';

class BigImageCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final bool hasLabel;

  const BigImageCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.hasLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset(
            image,
            height: 220,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          ListTile(
            title: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Text(
                subtitle,
                style: const TextStyle(color: Colors.grey),
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_outline,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
