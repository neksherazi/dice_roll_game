import '../screens/selection_screen.dart';
import 'package:flutter/material.dart';

class WinScreen extends StatelessWidget {
  final String whoWon;
  const WinScreen({super.key, required this.whoWon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$whoWon Won",
              style: const TextStyle(fontSize: 40),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SelectionScreen()));
              },
              style: const ButtonStyle(
                minimumSize: WidgetStatePropertyAll(Size(160, 50)),
                backgroundColor:
                    WidgetStatePropertyAll(Colors.deepOrangeAccent),
              ),
              child: const Text(
                "Play again",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
