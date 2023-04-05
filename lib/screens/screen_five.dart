import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

import '../models/model_five.dart';

class ScreenFive extends StatefulWidget {
  const ScreenFive({super.key});

  @override
  State<ScreenFive> createState() => _ScreenFiveState();
}

class _ScreenFiveState extends State<ScreenFive> {
  List<PostModelFive> postsList = [];

  final TextEditingController _userIdC = TextEditingController();
  final TextEditingController _titleC = TextEditingController();
  final TextEditingController _bodyC = TextEditingController();

  PostModelFive? _put;

  Future<PostModelFive?> putData(
      String userId, String title, String body) async {
    PostModelFive? postModelFive;

    http.Response response = await http.put(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
      body: {
        "userId": userId,
        "title": title,
        "body": body,
      },
    );
    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      postModelFive = PostModelFive.fromJson(data);
      debugPrint("UPDATED");
      return postModelFive;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PUT /posts/1'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Update an object of the list',
              style: TextStyle(
                color: Color(0xffE48965),
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
                    height: 10,
                  ),
                  TextFormField(
                    controller: _titleC,
                    decoration: const InputDecoration(labelText: 'title'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _bodyC,
                    decoration: const InputDecoration(labelText: 'body'),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      PostModelFive? post = await putData(
                          _userIdC.text, _titleC.text, _bodyC.text);
                      setState(() {
                        _put = post;
                      });
                    },
                    child: const Text('Submit'),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  _put == null
                      ? const SpinKitPouringHourGlass(
                          color: Colors.black45,
                          size: 80.0,
                        )
                      : Text(
                          "Post: ${_put!.id} is successfully updated by \nUser: ${_put!.userId} with \nTitle: ${_put!.title} \nBody: ${_put!.body}",
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
