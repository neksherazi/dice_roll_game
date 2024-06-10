import 'dart:math';
import 'package:flutter/material.dart';
import '../screens/win_screen.dart';

class PlayWithFriend extends StatefulWidget {
  const PlayWithFriend({super.key});

  @override
  State<PlayWithFriend> createState() => _PlayWithFriendState();
}

class _PlayWithFriendState extends State<PlayWithFriend> {
  bool switchPlayer = true;
  int p1Score = 0;
  int p2Score = 0;
  String p1Dice = 'assets/Images/Black Dice/1.png';
  String p2Dice = 'assets/Images/White dice/dice1.png';

  void rollDiceP1() {
    Random ran = Random();
    setState(() {
      int randN = ran.nextInt(6) + 1;
      p1Score += randN;
      p1Dice = 'assets/Images/Black Dice/$randN.png';
      if (p1Score >= 60) {
        debugPrint("Player 1");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const WinScreen(whoWon: "Player 1"),
          ),
        );
      } else {
        Future.delayed(
          const Duration(milliseconds: 200),
          () => setState(() {
            switchPlayer = !switchPlayer;
          }),
        );
      }
    });
  }

  void rollDiceP2() {
    Random ran = Random();
    setState(() {
      int randN = ran.nextInt(6) + 1;
      p2Score += randN;
      p2Dice = 'assets/Images/White dice/dice$randN.png';
      if (p2Score >= 60) {
        debugPrint("Player 2");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const WinScreen(whoWon: "Player 2"),
          ),
        );
      } else {
        Future.delayed(
          const Duration(milliseconds: 200),
          () => setState(() {
            switchPlayer = !switchPlayer;
          }),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Playing With Friend",
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
            const SizedBox(height: 200),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                switchPlayer ? _p1Side(context) : _p2Side(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _p2Side(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Player 2",
          style: TextStyle(fontSize: 30),
        ),
        const SizedBox(height: 10),
        Image(
          image: AssetImage(p2Dice),
          width: 150,
          height: 150,
        ),
        Text(
          "Score: $p2Score",
          style: const TextStyle(fontSize: 25),
        ),
        ElevatedButton(
          onPressed: () {
            rollDiceP2();
          },
          style: const ButtonStyle(
            minimumSize: WidgetStatePropertyAll(Size(100, 40)),
            backgroundColor: WidgetStatePropertyAll(Colors.deepOrangeAccent),
          ),
          child: const Text(
            "Roll",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _p1Side(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Player 1",
          style: TextStyle(fontSize: 30),
        ),
        const SizedBox(height: 10),
        Image(
          image: AssetImage(p1Dice),
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
        Text(
          "Score: $p1Score",
          style: const TextStyle(fontSize: 25),
        ),
        ElevatedButton(
          onPressed: () {
            rollDiceP1();
          },
          style: const ButtonStyle(
            minimumSize: WidgetStatePropertyAll(Size(100, 40)),
            backgroundColor: WidgetStatePropertyAll(Colors.deepOrangeAccent),
          ),
          child: const Text(
            "Roll",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
