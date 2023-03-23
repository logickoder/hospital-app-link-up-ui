import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({Key? key, required this.hint}) : super(key: key);

  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        prefixIcon: const Icon(Icons.search_outlined),
        suffixIcon: const Icon(Icons.settings_outlined),
        hintText: hint,
      ),
    );
  }
}
