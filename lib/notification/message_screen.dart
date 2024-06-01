import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  final String id;
  const MessageScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Message Screen',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red[500],
      ),
      body: Center(
        child: Text(
          "Message Screen".toUpperCase(),
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.red[600]),
        ),
      ),
    );
  }
}
