import 'dart:math';
import 'package:flutter/material.dart';
import '../screens/win_screen.dart';

class PlayWithComputer extends StatefulWidget {
  const PlayWithComputer({super.key});

  @override
  State<PlayWithComputer> createState() => _PlayWithComputerState();
}

class _PlayWithComputerState extends State<PlayWithComputer> {
  int computerScore = 0;
  int yourScore = 0;
  String comDice = 'assets/Images/Black Dice/1.png';
  String yourDice = 'assets/Images/White dice/dice1.png';

  void rollDice() {
    Random ran = Random();
    setState(() {
      int randP = ran.nextInt(6) + 1;
      yourScore += randP;
      yourDice = 'assets/Images/White dice/dice$randP.png';

      int randC = ran.nextInt(6) + 1;
      computerScore += randC;
      comDice = "assets/Images/Black Dice/$randC.png";
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
                  "Playing With Computer",
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
            const SizedBox(height: 200),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text(
                      "Computer",
                      style: TextStyle(fontSize: 30),
                    ),
                    const SizedBox(height: 10),
                    Image(
                      image: AssetImage(comDice),
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      "Score: $computerScore",
                      style: const TextStyle(fontSize: 25),
                    ),
                  ],
                ),
                const SizedBox(width: 50),
                Column(
                  children: [
                    const Text(
                      "You",
                      style: TextStyle(fontSize: 30),
                    ),
                    const SizedBox(height: 10),
                    Image(
                      image: AssetImage(yourDice),
                      width: 150,
                      height: 150,
                    ),
                    Text(
                      "Score: $yourScore",
                      style: const TextStyle(fontSize: 25),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                rollDice();
                if (yourScore >= 60) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WinScreen(whoWon: "Player"),
                    ),
                  );
                }
                if (computerScore >= 60) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WinScreen(whoWon: "Computer"),
                    ),
                  );
                }
              },
              style: const ButtonStyle(
                minimumSize: WidgetStatePropertyAll(Size(160, 50)),
                backgroundColor:
                    WidgetStatePropertyAll(Colors.deepOrangeAccent),
              ),
              child: const Text(
                "Roll",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
