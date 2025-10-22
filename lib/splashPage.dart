import 'package:flutter/material.dart';
import 'package:flutter_application_1/homePage.dart';

class Splashpage extends StatefulWidget {
  const Splashpage({super.key});

  @override
  State<Splashpage> createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/saving_logo.jpg', scale: 4.0),
            SizedBox(height: 20.0),
            Text(
              'My Saving Tracker',
              style: TextStyle(
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Manage your savings effectively',
              style: TextStyle(fontSize: 18.0, color: Colors.black54),
            ),
            SizedBox(height: 20.0),
            CircularProgressIndicator(),
            SizedBox(height: 10.0),
            Text(
              'Loading...',
              style: TextStyle(fontSize: 10.0, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
