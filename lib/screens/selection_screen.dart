// ignore_for_file: sized_box_for_whitespace

import '../screens/with_computer.dart';
import '../screens/with_friend.dart';
import 'package:flutter/material.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _playWithComputer(context),
            const SizedBox(height: 20),
            _playWithFriend(context),
          ],
        ),
      ),
    );
  }

  Widget _playWithFriend(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const PlayWithFriend()));
      },
      child: Container(
        width: 150,
        height: 150,
        child: const Column(
          children: [
            Icon(
              Icons.group,
              color: Colors.deepOrangeAccent,
              size: 120,
            ),
            Text(
              "Play with friend",
              style: TextStyle(
                color: Colors.deepOrangeAccent,
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _playWithComputer(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const PlayWithComputer()));
      },
      child: Container(
        width: 150,
        height: 150,
        child: const Column(
          children: [
            Icon(
              Icons.computer,
              color: Colors.deepOrangeAccent,
              size: 120,
            ),
            Text(
              "Play with computer",
              style: TextStyle(
                color: Colors.deepOrangeAccent,
                fontWeight: FontWeight.bold,
                fontSize: 16.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
