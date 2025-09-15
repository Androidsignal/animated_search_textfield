import 'package:animated_search_textfield/animated_search_textfield.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ExampleScreen(),
    );
  }
}

class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: AnimatedSearchTextField(
          expandedWidth: 300, // The width when expanded
          /// searchTextField: The TextField widget to be displayed when expanded
          searchTextField: TextField(
            readOnly: false,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Search here...",
              hintStyle: TextStyle(color: Colors.grey.shade600, fontSize: 16),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            ),
            style: const TextStyle(color: Colors.black, fontSize: 16),
            cursorColor: Colors.deepOrange,
          ),
          iconSize: 30, // The size of icon
          iconBackgroundColor:
              Colors.blueAccent, // The background color of icon
          iconColor: Colors.white, // The color of icon
          /// floatingActionButton: You can provide your own FloatingActionButton widget
          floatingActionButton: FloatingActionButton.large(
            backgroundColor: Colors.blueAccent,
            shape: CircleBorder(
              side: BorderSide(color: Colors.grey.shade300),
            ),
            onPressed: () {},
            child: const Icon(Icons.search, color: Colors.black),
          ),
          searchTextFieldColor:
              Colors.grey, // The background color of TextField
          backIcon: Icons.arrow_back, // back icon
          searchIcon: Icons.search, // search icon
          duration: const Duration(milliseconds: 300), // duration of animation
        ),
      ),
    );
  }
}
