import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deeplinking_with_single_task/deep_link_screen.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late AppLinks _appLinks;
  StreamSubscription<Uri>? _linkSubscription;

  @override
  void initState() {
    super.initState();
    initDeepLinks();
  }

  @override
  void dispose() {
    _linkSubscription?.cancel();
    super.dispose();
  }

  void initDeepLinks() {
    _appLinks = AppLinks();
    _linkSubscription = _appLinks.uriLinkStream.listen((uri) {
      /// https://hotel-sa.co/room_details.php?id=762
      Map<String, String> queryParams = uri.queryParameters;
      // Extract individual values
      String id = queryParams['id'] ?? '';
      debugPrint('Uri Link: $uri');
      debugPrint('Uri Link: $id');
      openAppLink(uri);
    });
  }

  void openAppLink(Uri uri) {
    Map<String, String> queryParams = uri.queryParameters;
    // Extract individual values
    String id = queryParams['id'] ?? '';
    if(id.isNotEmpty){
      Get.to(() => DeepLinkScreen(id: id));
    } else{
      Get.snackbar('Error', 'Invalid deep link url',snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text(
          "Home Screen",
          style: TextStyle(color: Colors.black, fontSize: 32.0),
        ),
      ),
    );
  }
}
