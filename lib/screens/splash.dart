import 'package:dice_game/screens/selection_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const SelectionScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(
                'assets/Images/White dice/dice6.png',
              ),
              width: 200,
              height: 200,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Dice Game",
              style: TextStyle(
                fontSize: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
