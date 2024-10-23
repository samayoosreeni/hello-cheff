import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:myapp/login.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 2000, // Duration of splash screen animation
      splash: Container(
        height: 500,
        width: 250,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://cdn2.iconfinder.com/data/icons/food-restaurant-1/128/flat-13-1024.png'),
            fit: BoxFit.contain, // Adjust the fit as per your needs
          ),
        ),
      ),
      nextScreen: login(), // Widget to navigate to after splash screen
      splashTransition: SplashTransition.fadeTransition, // Splash transition animation
      backgroundColor: Colors.white, // Background color of the splash screen
    );
  }
}
