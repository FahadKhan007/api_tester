import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

import '../models/model_seven.dart';

class ScreenSeven extends StatefulWidget {
  const ScreenSeven({super.key});

  @override
  State<ScreenSeven> createState() => _ScreenSevenState();
}

class _ScreenSevenState extends State<ScreenSeven> {
  List<PostModelSeven> postsList = [];

  final TextEditingController _userIdC = TextEditingController();
  final TextEditingController _titleC = TextEditingController();
  final TextEditingController _bodyC = TextEditingController();

  PostModelSeven? _delete;

  Future<PostModelSeven> deleteData(String userId) async {
    PostModelSeven? postModelSeven;

    http.Response response = await http.delete(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
    );
    var data = json.decode(response.body);
    postModelSeven = PostModelSeven.fromJson(data);
    return postModelSeven;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('PATCH /posts/1'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Delete an object from the list',
              style: TextStyle(
                color: Colors.green,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _userIdC,
                    decoration: const InputDecoration(
                      labelText: 'user id',
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      PostModelSeven delete = await deleteData(_userIdC.text);
                      setState(() {
                        _delete = delete;
                      });
                    },
                    child: const Text('Submit'),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  _delete == null
                      ? const SpinKitFoldingCube(
                          color: Colors.black45,
                          size: 80.0,
                        )
                      : Text(
                          "Post: ${_delete!} is deleted by \nUser: ${_delete!}",
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
