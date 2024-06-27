import 'package:flutter/material.dart';

class DeepLinkScreen extends StatefulWidget {
  String? id;
  DeepLinkScreen({super.key,this.id});

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
      body: Center(
        child: Text(
          "ID : ${widget.id}",
          style: const TextStyle(color: Colors.white, fontSize: 32.0),
        ),
      ),
    );
  }
}
