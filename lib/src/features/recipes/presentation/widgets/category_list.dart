import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/styles/text/text_styles.dart';

class CategoryList extends StatefulWidget {
  final List<String> selectedCategories;

  const CategoryList({super.key, required this.selectedCategories});

  @override
  CategoryListState createState() => CategoryListState();
}

class CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text(
        'Kategorien',
        style: GrootlyTextStyle.headlineB4,
      ),
      children: [
        CheckboxListTile(
          value: widget.selectedCategories.contains('Frühling'),
          onChanged: (value) {
            setState(() {
              if (value!) {
                widget.selectedCategories.add('Frühling');
              } else {
                widget.selectedCategories.remove('Frühling');
              }
            });
          },
          title: const Text('Frühling'),
        ),
        CheckboxListTile(
          value: widget.selectedCategories.contains('Sommer'),
          onChanged: (value) {
            setState(() {
              if (value!) {
                widget.selectedCategories.add('Sommer');
              } else {
                widget.selectedCategories.remove('Sommer');
              }
            });
          },
          title: const Text('Sommer'),
        ),
        CheckboxListTile(
          value: widget.selectedCategories.contains('Herbst'),
          onChanged: (value) {
            setState(() {
              if (value!) {
                widget.selectedCategories.add('Herbst');
              } else {
                widget.selectedCategories.remove('Herbst');
              }
            });
          },
          title: const Text('Herbst'),
        ),
        CheckboxListTile(
          value: widget.selectedCategories.contains('Winter'),
          onChanged: (value) {
            setState(() {
              if (value!) {
                widget.selectedCategories.add('Winter');
              } else {
                widget.selectedCategories.remove('Winter');
              }
            });
          },
          title: const Text('Winter'),
        ),
        CheckboxListTile(
          value: widget.selectedCategories.contains('Basics'),
          onChanged: (value) {
            setState(() {
              if (value!) {
                widget.selectedCategories.add('Basics');
              } else {
                widget.selectedCategories.remove('Basics');
              }
            });
          },
          title: const Text('Basics'),
        ),
      ],
    );
  }
}
