import 'package:api_app/screens/screen_five.dart';
import 'package:api_app/screens/screen_one.dart';
import 'package:api_app/screens/screen_three.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'screens/screen_four.dart';
import 'screens/screen_seven.dart';
import 'screens/screen_six.dart';
import 'screens/screen_two.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD2EAF7),
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Api Tester',
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ScreenOne()),
                );
              },
              child: const Text('GET /posts'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ScreenTwo()),
                );
              },
              child: const Text('GET /posts/1'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ScreenThree()),
                );
              },
              child: const Text('GET /comments?postId=1'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ScreenFour()),
                );
              },
              child: const Text('POST /posts'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ScreenFive()),
                );
              },
              child: const Text('PUT /posts/1'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ScreenSix()),
                );
              },
              child: const Text('PATCH /posts/1'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ScreenSeven()),
                );
              },
              child: const Text('DELETE /posts/1'),
            ),
          ],
        ),
      ),
    );
  }
}
