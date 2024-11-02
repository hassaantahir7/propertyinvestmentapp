import 'package:flutter/material.dart';
import 'package:property_investment_app/forget_pass.dart';
import 'package:property_investment_app/login_thre.dart';
import 'package:property_investment_app/login_three.dart';
import 'package:property_investment_app/register_one.dart';

class LoginTwo extends StatelessWidget {
  const LoginTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView( // Make the body scrollable
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                  left: screenWidth * 0.03,
                  top: screenHeight * 0.03,
                ),
                child: Container(
                  height: screenHeight * 0.25, // Adjust height to be responsive
                  width: screenWidth * 0.9, // Adjust width to be responsive
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/unique_img.png'),
                      fit: BoxFit.cover, // Cover the container
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: screenWidth * 0.49, top: 10), // Adjust padding
              child: RichText(
                text: const TextSpan(children: [
                  TextSpan(
                    text: "Let's",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                      color: Color(0xff252B5C),
                    ),
                  ),
                  TextSpan(
                    text: ' Sign In',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      color: Color(0xff252B5C),
                    ),
                  ),
                ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: screenWidth * 0.42, top: 20),
              child: const Text(
                'Sign in to Manage Properties',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  color: Color(0xff53587A),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Email TextFormField
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: 15),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginThree()),
                  );
                },
                child: AbsorbPointer(
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 21),
                      prefixIcon: const Icon(Icons.email_outlined, color: Color(0xff252B5C)),
                      hintText: 'Email',
                      hintStyle: const TextStyle(
                        color: Color(0xffA1A5C1),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                      fillColor: const Color(0xffF5F4F8),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xffF5F4F8)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xffF5F4F8)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginThree()));
                },
                child: AbsorbPointer(
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 21),
                      prefixIcon: const Icon(Icons.lock_outline_rounded, color: Color(0xff252B5C)),
                      hintText: 'Password',
                      hintStyle: const TextStyle(
                        color: Color(0xffA1A5C1),
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      fillColor: const Color(0xffF5F4F8),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xffF5F4F8)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xffF5F4F8)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4),
            // Forgot Password
            Padding(
              padding: const EdgeInsets.only(top: 8, right: 20),
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    // Replace 'ForgotPasswordScreen' with the actual screen you want to navigate to
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgetPass()),
                    );
                  },
                  child: Text(
                    'Forgot Password?     ',
                    style: TextStyle(
                      color: Color(0xff1F4C6B),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 28, right: 30, left: 30),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Color(0xffECEDF3),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'OR',
                      style: TextStyle(
                        color: Color(0xffA1A5C1),
                        fontFamily: 'Montserrat',
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Color(0xffECEDF3),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Center align buttons
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      height: 70,
                      width: 148.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: const DecorationImage(
                          image: AssetImage('assets/icons8-google-25.png'),
                        ),
                        color: const Color(0xffF5F4F8),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10), // Space between buttons
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      height: 70,
                      width: 148.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: const DecorationImage(
                          image: AssetImage('assets/facebook.png'),
                        ),
                        color: const Color(0xffF5F4F8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 33),
              child: GestureDetector(onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterOne()));
              },
                child: RichText(
                  text: const TextSpan(children: [
                    TextSpan(
                      text: "Don't have an account?",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xff53587A),
                      ),
                    ),
                    TextSpan(
                      text: ' Register',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff53587A),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}