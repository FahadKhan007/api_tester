import 'dart:convert';

import 'package:flutter/material.dart';
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

  PostModelSeven? _delete;

  Future<PostModelSeven?> deleteData() async {
    PostModelSeven? postModelSeven;

    http.Response response = await http.delete(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
    );
    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Color(0xffE48965),
          content: Text('POST/1 deleted successfully'),
        ),
      );

      postModelSeven = PostModelSeven.fromJson(data);
      return postModelSeven;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DELETE /posts/1'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Delete an object from the list',
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
                    ElevatedButton(
                      onPressed: () async {
                        PostModelSeven? delete = await deleteData();
                        setState(() {
                          _delete = delete;
                        });
                      },
                      child: const Text('Delete'),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    _delete == null
                        ? const SpinKitHourGlass(
                            color: Colors.black45,
                            size: 80.0,
                          )
                        : const Text(
                            "Post: 1 is deleted",
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
