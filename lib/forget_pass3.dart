import 'package:flutter/material.dart';
import 'package:property_investment_app/forget_pass.dart';
import 'package:property_investment_app/login_one.dart';
import 'package:property_investment_app/register_one.dart';

import 'forget_pass4.dart';
class ForgetPassThree extends StatefulWidget {
  const ForgetPassThree({super.key});

  @override
  State<ForgetPassThree> createState() => _ForgetPassTwoState();
}

class _ForgetPassTwoState extends State<ForgetPassThree> {

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.01), // 5% of screen height

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
                  Padding(
                    padding: EdgeInsets.only(right: 140, top: screenHeight * 0.07), // 40% of screen width, 5% of screen height
                    child: RichText(
                      text: const TextSpan(children: [
                        TextSpan(
                          text: 'Password reset',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                            color: Color(0xff252B5C),
                          ),
                        ),

                      ]),
                    ),
                  ),  const Padding(
                    padding: EdgeInsets.only(right: 20, top: 15),
                    child: Text(
                      'Your password has been successfully reset.',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Color(0xff53587A)),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 73, top: 13),
                    child: Text(
                      'click confirm to set a new password',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Color(0xff53587A)),
                    ),
                  ),
                  SizedBox(height: 25,),
                  // Otp Input Fields

                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.03), // 5% of screen height
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
                              MaterialPageRoute(builder: (context) => const ForgetPassFour()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            SizedBox(width: screenWidth * 0.02), // Responsive spacing
                            Text(
                              'Confirm',
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


                ]
            ),
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
    );;
  }
}
