import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:reset_api_practice/models/UsersModel.dart';
import 'package:http/http.dart' as http;

class ExampleThree extends StatefulWidget {
  const ExampleThree({Key? key}) : super(key: key);

  @override
  State<ExampleThree> createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<ExampleThree> {
  List<UsersModel> userList = [];

  Future<List<UsersModel>> getUsersApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      for (Map i in data) {
        userList.add(UsersModel.fromJson(i));
      }
      return userList;
    }
    else{
      return userList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Example Three"),
      ),
      body: Column(
        children: [
          Expanded(child: FutureBuilder(
              future:  getUsersApi(),
              builder: (context,AsyncSnapshot<List<UsersModel>> snapshot){
                if(!snapshot.hasData){
                 return CircularProgressIndicator();
                }
                else{
                  return ListView.builder(
                       itemCount: userList.length,
                       itemBuilder: (context , index){
                         return Card(
                           child: Column(
                             children: [
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   const Text("Name: "),
                                   Text(snapshot.data![index].name.toString()),
                                  // Text(snapshot.data[index].address!.city.toString()),
                                 ],
                               )
                             ],
                           ),
                         );
                       });
                }
          })
          )
        ],
      ),
    );
  }
}
