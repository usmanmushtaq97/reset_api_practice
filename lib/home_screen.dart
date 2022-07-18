import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/PostDataModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PostDataModel> postModelList = [];

  Future<List<PostDataModel>> getPostApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        postModelList.add(PostDataModel.fromJson(i));
      }
      return postModelList;
    } else {
      return postModelList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Title"),
        ),
        body: Column(
          children: [
            FutureBuilder(
                future: getPostApi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Text("Loading....");
                  } else {
                    return Expanded(
                      child: ListView.builder(
                          itemCount: postModelList.length,
                          itemBuilder: (context, index) {
                            return Card(
                                child: Text(
                                    postModelList[index].title.toString()));
                          }),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}
