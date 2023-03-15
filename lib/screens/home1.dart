import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String? user_token;
  const HomeScreen({super.key, required this.user_token});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
