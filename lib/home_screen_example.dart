import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreenExample extends StatefulWidget {
  const HomeScreenExample({Key? key}) : super(key: key);

  @override
  State<HomeScreenExample> createState() => _HomeScreenExampleState();
}

class _HomeScreenExampleState extends State<HomeScreenExample> {
  List<PhotoModel> photoList = [];

  // Future<List<PhotoModel>> getPostApi() async {
  //   final response = http.get()
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Example 2"),
      ),
    );
  }
}
// model class

class PhotoModel {
  final String title, url;
  PhotoModel(this.title, this.url);
}