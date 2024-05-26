import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Push Notification".toUpperCase()),
        backgroundColor: Colors.amber[400],
      ),
      body: Center(
        child: Text(
          "Welcome to homescreen".toUpperCase(),
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}