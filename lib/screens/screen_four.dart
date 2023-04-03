import 'dart:convert';

import 'package:api_app/models/model_four.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

class ScreenFour extends StatefulWidget {
  const ScreenFour({super.key});

  @override
  State<ScreenFour> createState() => _ScreenFourState();
}

class _ScreenFourState extends State<ScreenFour> {
  List<PostModelFour> postsList = [];

  final TextEditingController _userIdC = TextEditingController();
  final TextEditingController _titleC = TextEditingController();
  final TextEditingController _bodyC = TextEditingController();

  PostModelFour? _post;

  Future<PostModelFour?> postData(
      String userId, String title, String body) async {
    PostModelFour? postModelFour;
    http.Response response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      body: {
        "userId": userId,
        "title": title,
        "body": body,
      },
    );
    var data = json.decode(response.body);
    if (response.statusCode == 201) {
      postModelFour = PostModelFour.fromJson(data);
      debugPrint('POSTED');
      return postModelFour;
    } else {
      debugPrint("NOT POSTED");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('POST /posts'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Post an object to the list',
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
                      PostModelFour? post = await postData(
                          _userIdC.text, _titleC.text, _bodyC.text);
                      setState(() {
                        _post = post;
                      });
                    },
                    child: const Text('Submit'),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  _post == null
                      ? const SpinKitDancingSquare(
                          color: Colors.black45,
                          size: 80.0,
                        )
                      : Text(
                          "Post: ${_post!.id} is successfully posted by \nUser: ${_post!.userId} with \nTitle: ${_post!.title} \nBody: ${_post!.body}",
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
