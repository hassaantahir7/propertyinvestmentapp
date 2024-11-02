import 'package:flutter/material.dart';
import 'package:property_investment_app/forget_pass.dart';
import 'package:property_investment_app/login_two.dart';
import 'package:property_investment_app/onBoard.dart';
import 'package:property_investment_app/register_one.dart';

class LoginThree extends StatelessWidget {
  const LoginThree({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery
        .of(context)
        .size;
    final isSmallScreen = screenSize.width < 600;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: screenSize.height),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenSize.width * 0.05,
              vertical: screenSize.height * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenSize.height * 0.02),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xffF5F4F8),
                    ),


                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginTwo()),
                          );
                        },

                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Color(0xff252B5C),
                          size: 15,
                        ),
                      ),

                  ),
                ),
                SizedBox(height: screenSize.height * 0.04),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "Let's",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                          color: Color(0xff252B5C),
                        ),
                      ),
                      TextSpan(
                        text: ' Sign In',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                          color: Color(0xff252B5C),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Sign in to Manage Properties',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color(0xff53587A),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.04),
                _buildTextField(
                  icon: Icons.email_outlined,
                  hintText: 'Email',
                ),
                SizedBox(height: screenSize.height * 0.02),
                _buildTextField(
                  icon: Icons.lock_outline,
                  hintText: 'Password',
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPass()));
                    },
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPass()));
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Color(0xff1F4C6B),
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.03),
                Center(
                  child: SizedBox(
                    width: isSmallScreen ? screenSize.width * 0.67 : 280,
                    height: 63,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => OnBoard()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff2E429E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.03),
                _buildDividerWithText(),
                SizedBox(height: screenSize.height * 0.03),
                _buildSocialLoginButtons(isSmallScreen, screenSize),
                SizedBox(height: screenSize.height * 0.03),
                Center(
                  child: GestureDetector(onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterOne()));
                  },
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color(0xff53587A),
                            ),
                          ),
                          TextSpan(
                            text: 'Register',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff53587A),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required IconData icon, required String hintText}) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 21),
        prefixIcon: Icon(icon, color: const Color(0xff252B5C)),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color(0xffA1A5C1),
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
          borderSide: const BorderSide(color: Color(0xff2E429E)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _buildDividerWithText() {
    return const Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 12),
            child: Divider(
              thickness: 1,
              color: Color(0xffECEDF3),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'OR',
            style: TextStyle(
              color: Color(0xffA1A5C1),
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 12),
            child: Divider(
              thickness: 1,
              color: Color(0xffECEDF3),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialLoginButtons(bool isSmallScreen, Size screenSize) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialButton(
            'assets/icons8-google-25.png', isSmallScreen, screenSize),
        const SizedBox(width: 10),
        _buildSocialButton('assets/facebook.png', isSmallScreen, screenSize),
      ],
    );
  }

  Widget _buildSocialButton(String assetPath, bool isSmallScreen,
      Size screenSize) {
    return Container(
      height: 70,
      width: isSmallScreen ? screenSize.width * 0.4 : 165,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(
          image: AssetImage(assetPath),
        ),
        color: const Color(0xffF5F4F8),
      ),
    );
  }
}