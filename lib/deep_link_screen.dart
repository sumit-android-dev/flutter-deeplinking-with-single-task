import 'package:flutter/material.dart';

class DeepLinkScreen extends StatefulWidget {
  const DeepLinkScreen({super.key});

  @override
  State<DeepLinkScreen> createState() => _DeepLinkScreenState();
}

class _DeepLinkScreenState extends State<DeepLinkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Deep link"),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.orangeAccent,
      body: const Center(
        child: Text(
          "Deep Link Screen",
          style: TextStyle(color: Colors.white, fontSize: 32.0),
        ),
      ),
    );
  }
}
