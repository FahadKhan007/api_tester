import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

import '../models/model_six.dart';

class ScreenSix extends StatefulWidget {
  const ScreenSix({super.key});

  @override
  State<ScreenSix> createState() => _ScreenSixState();
}

class _ScreenSixState extends State<ScreenSix> {
  List<PostModelSix> postsList = [];

  final TextEditingController _userIdC = TextEditingController();
  final TextEditingController _titleC = TextEditingController();
  final TextEditingController _bodyC = TextEditingController();

  PostModelSix? _patch;

  Future<PostModelSix?> patchData(
      String userId, String title, String body) async {
    PostModelSix? postModelSix;

    http.Response response = await http.patch(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
      body: {
        "userId": userId,
        "title": title,
        // "body": body,
      },
    );
    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      postModelSix = PostModelSix.fromJson(data);
      debugPrint("PARTIALLY UPDATED");
      return postModelSix;
    } else {
      return null;
    }
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
              'Partially update an object of the list',
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
                    decoration: const InputDecoration(
                        labelText: 'body (this option is currently disabled)'),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      PostModelSix? patch = await patchData(
                          _userIdC.text, _titleC.text, _bodyC.text);
                      setState(() {
                        _patch = patch;
                      });
                    },
                    child: const Text('Submit'),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  _patch == null
                      ? const SpinKitFoldingCube(
                          color: Colors.black45,
                          size: 80.0,
                        )
                      : Text(
                          "Post: ${_patch!.id} is partially updated by \nUser: ${_patch!.userId} with \nTitle: ${_patch!.title} \nBody: ${_patch!.body}",
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
