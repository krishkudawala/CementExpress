import 'dart:async';

import 'package:cementexpress/Screens/Home/home_screen.dart';
import 'package:cementexpress/Screens/Login/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() =>
      _SplashScreenState();
}

class _SplashScreenState
    extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  final FirebaseAuth auth =
      FirebaseAuth.instance;

  late AnimationController controller;

  late Animation<double> scaleAnimation;

  @override
  void initState() {

    super.initState();

    // ANIMATION CONTROLLER
    controller = AnimationController(

      vsync: this,

      duration: const Duration(
        seconds: 2,
      ),
    );

    // SCALE ANIMATION
    scaleAnimation = Tween<double>(
      begin: 0.6,
      end: 1.0,
    ).animate(

      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOutBack,
      ),
    );

    controller.forward();

    // NEXT SCREEN
    Timer(
      const Duration(seconds: 3),
      nextscreen,
    );
  }

  void nextscreen() {

    if (auth.currentUser == null) {

      Navigator.pushReplacement(

        context,

        MaterialPageRoute(
          builder: (context) =>
          const LoginPage(),
        ),
      );

    } else {

      Navigator.pushReplacement(

        context,

        MaterialPageRoute(
          builder: (context) =>
          const HomeScreen(),
        ),
      );
    }
  }

  @override
  void dispose() {

    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,

      body: Center(

        child: Column(

          mainAxisAlignment:
          MainAxisAlignment.center,

          children: [

            // LOGO ANIMATION
            ScaleTransition(

              scale: scaleAnimation,

              child: Container(

                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(

                  color: Colors.white,

                  borderRadius:
                  BorderRadius.circular(30),

                  boxShadow: [

                    BoxShadow(

                      color: Colors.grey
                          .withOpacity(0.2),

                      blurRadius: 20,

                      spreadRadius: 5,

                      offset: const Offset(0, 8),
                    ),
                  ],
                ),

                child: Image.asset(

                  'assets/icons/logo.png',

                  height: 120,
                ),
              ),
            ),

            const SizedBox(height: 35),

            // APP NAME
            const Text(

              "Cement Express",

              style: TextStyle(

                fontSize: 32,

                fontWeight: FontWeight.bold,

                letterSpacing: 1.2,

                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 10),

            // TAGLINE
            Text(

              "Build Faster • Deliver Smarter",

              style: TextStyle(

                fontSize: 16,

                color: Colors.grey.shade600,

                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 50),

            // LOADING
            const CircularProgressIndicator(
              color: Colors.deepOrange,
            ),
          ],
        ),
      ),
    );
  }
}