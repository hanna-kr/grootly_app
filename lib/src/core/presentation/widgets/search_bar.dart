import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grootly_app/src/core/presentation/styles/border/border_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/color/color_style.dart';
import 'package:grootly_app/src/core/presentation/styles/padding/position_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/text/text_styles.dart';

class CustomSearchBar extends StatefulWidget {
  final Function(String)? onSearchChanged;

  const CustomSearchBar({
    super.key,
    this.onSearchChanged,
  });

  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _handleSearch() {
    widget.onSearchChanged?.call(_searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // Assuming `GrootlyColor`, `GrootlyBorderRadius`, etc. are valid constants.
        color: GrootlyColor.white,
        borderRadius: GrootlyBorderRadius.medium,
        border: Border.all(
          color: GrootlyColor.lightgreen2,
        ),
      ),
      child: TextField(
        controller: _searchController,
        onChanged: (String value) {
          setState(() {}); // Update the UI when the text changes
          widget.onSearchChanged?.call(value);
        },
        onSubmitted: (_) => _handleSearch(),
        decoration: InputDecoration(
          hintText: 'Suche...',
          hintStyle: GrootlyTextStyle.search,
          border: InputBorder.none,
          suffixIcon: Material(
            color: Colors.transparent,
            child: IconButton(
              icon: FaIcon(FontAwesomeIcons.magnifyingGlass,
                  color: GrootlyColor.mediumgrey),
              onPressed: _handleSearch,
            ),
          ),
          contentPadding: PaddingAll.m,
        ),
        style: GrootlyTextStyle.buttonSecond,
      ),
    );
  }
}
