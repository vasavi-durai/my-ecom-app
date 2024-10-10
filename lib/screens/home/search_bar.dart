import 'package:flutter/material.dart';

class MySearchBar extends StatelessWidget {
  final Function(String) onSearch; 

  const MySearchBar({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 234, 227, 234),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: Row(
        children: [
          const Icon(
            Icons.search,
            color: Color.fromARGB(255, 43, 42, 43),
            size: 20,
          ),
          const SizedBox(width: 30),
          Flexible(
            flex: 4,
            child: TextField(
              onChanged: onSearch, 
              decoration: const InputDecoration(
                hintText: "Search....",
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
