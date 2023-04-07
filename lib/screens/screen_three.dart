import 'dart:convert';

import 'package:api_app/models/model_three.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ScreenThree extends StatelessWidget {
  const ScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    List<PostModelThree> commentsList = [];

    Future<List<PostModelThree>?> getData() async {
      final response = await http.get(
          Uri.parse('https://jsonplaceholder.typicode.com/comments?postId=1'));
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        commentsList.clear();
        for (Map<String, dynamic> index in data) {
          commentsList.add(PostModelThree.fromJson(index));
        }
        return commentsList;
      } else {
        return null;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GET /comments?postId=1',
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Retrived Objects from List',
            style: TextStyle(
              color: Color(0xffE48965),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: FutureBuilder(
                future: getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: commentsList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          color: const Color(0xffE48965),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          margin: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: 'postId: ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          commentsList[index].postId.toString(),
                                    ),
                                  ],
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: 'id: ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    TextSpan(
                                      text: commentsList[index].id.toString(),
                                    ),
                                  ],
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: 'name: ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    TextSpan(
                                      text: commentsList[index].name.toString(),
                                    ),
                                  ],
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: 'email: ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          commentsList[index].email.toString(),
                                    ),
                                  ],
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: 'body: ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    TextSpan(
                                      text: commentsList[index].body.toString(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}
