import 'package:flutter/material.dart';

class make_network_search_field extends StatelessWidget {
  const make_network_search_field({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade300,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent, width: 1),
            borderRadius: BorderRadius.circular(15),
          ),
          contentPadding: EdgeInsets.zero,
          prefixIcon: const Icon(Icons.search),
          labelText: 'Search...',
        ),
        // enabled: true,
      ),
    );
  }
}
