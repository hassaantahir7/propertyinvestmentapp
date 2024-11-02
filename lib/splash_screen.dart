import 'package:flutter/material.dart';
import 'package:property_investment_app/splash_screentwo.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Center the column
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50), // Adjust as needed
            child: Center(
              child: Container(
                height: 375,
                width: 375,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/splash_screen.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20), // Add some space
          Container(
            height: 54,
            width: MediaQuery.of(context).size.width * 0.37,
            decoration: BoxDecoration(
              color: const Color(0xff2E429E),
              borderRadius: BorderRadius.circular(50),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SplashScreentwo()),
                );
              },
              child: const Center(
                child: Text(
                  "Let's start",
                  style: TextStyle(color: Color(0xffFFFFFF), fontSize: 18,fontFamily:'Lato' ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
