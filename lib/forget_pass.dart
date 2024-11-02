import 'package:flutter/material.dart';
import 'package:property_investment_app/forget_pass2.dart';

import 'login_one.dart';
class ForgetPass extends StatefulWidget {
  const ForgetPass({super.key});

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
   @override
    Widget build(BuildContext context) {
      // Get screen dimensions
      final screenWidth = MediaQuery.of(context).size.width;
      final screenHeight = MediaQuery.of(context).size.height;

      return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05), // 5% of screen width
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.07), // 5% of screen height

                // Image Row for network images
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ImageWidget(
                      assetPath: 'assets/login_one_img.png',
                      size: screenWidth * 0.4, // 40% of screen width
                    ),
                    ImageWidget(
                      assetPath: 'assets/login_two_img.png',
                      size: screenWidth * 0.4,
                    ),
                  ],
                ),
                // Login Button
                Padding(
                  padding: EdgeInsets.only(right: 68, top: screenHeight * 0.05), // 40% of screen width, 5% of screen height
                  child: RichText(
                    text: const TextSpan(children: [
                      TextSpan(
                        text: 'Forgot your password?',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                          color: Color(0xff252B5C),
                        ),
                      ),

                    ]),
                  ),
                ),  const Padding(
                  padding: EdgeInsets.only(right: 25, top: 15),
                  child: Text(
                    'Please enter your email to reset the password',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Color(0xff53587A)),
                  ),
                ),
                SizedBox(height: 30,),
                // Continue with Email

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.010,),
                  child:  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 21),
                      prefixIcon: const Icon(Icons.email_outlined , color: Color(0xff252B5C)),
                      hintText: 'Email',
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
                        borderSide: const BorderSide(color: Color(0xffF5F4F8)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),



                ),
                Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.08), // 5% of screen height
                  child: Container(
                    height: screenHeight * 0.08, // Responsive height
                    width: screenWidth * 0.60, // 75% of screen width
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xff2E429E),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const ForgetPassTwo()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          SizedBox(width: screenWidth * 0.02), // Responsive spacing
                          Text(
                            'Reset Password',
                            style: TextStyle(
                              color: const Color(0xffFFFFFF),
                              fontSize: screenWidth * 0.040, // Responsive font size
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),



SizedBox(height: 8,),

                Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.04),
                  child: GestureDetector(onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginOne()));
                  },
                    child: Center(
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "Back to Login",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Color(0xff687D92),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

// Updated ImageWidget to support network images
  class ImageWidget extends StatelessWidget {
  final String? assetPath;
  final String? networkUrl;
  final double size;

  const ImageWidget({
  this.assetPath,
  this.networkUrl,
  Key? key,
  required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return Container(
  width: size,
  height: size,
  decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(20), // Changed radius to 20
  boxShadow: const [
  BoxShadow(
  color: Colors.black26,
  blurRadius: 5,
  offset: Offset(2, 2),
  ),
  ],
  ),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(20), // Changed radius to 20
  child: networkUrl != null
  ? Image.network(
  networkUrl!,
  fit: BoxFit.cover,
  errorBuilder: (context, error, stackTrace) {
  return const Center(child: Text('Image not found'));
  },
  )
      : Image.asset(
  assetPath!,
  fit: BoxFit.cover,
  errorBuilder: (context, error, stackTrace) {
  return const Center(child: Text('Image not found'));
  },
  ),
  ),
  );
  }
}
