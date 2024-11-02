import 'package:flutter/material.dart';
import 'package:property_investment_app/forget_pass.dart';
import 'package:property_investment_app/login_one.dart';
import 'package:property_investment_app/register_one.dart';

import 'forget_pass4.dart';
class ForgetPassFive extends StatefulWidget {
  const ForgetPassFive({super.key});

  @override
  State<ForgetPassFive> createState() => _ForgetPassTwoState();
}

class _ForgetPassTwoState extends State<ForgetPassFive> {

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
                  SizedBox(height: 40,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.010,),
                    child:  Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        
                      ),
                      child: AbsorbPointer(
                        child: TextFormField(
                          decoration: InputDecoration(
                            fillColor: const Color(0xffEFF4FF),
                            filled: true,

                            prefixIcon: Center(child: Icon(Icons.done_rounded,color:Color(0xff2E429E),size: 50, )),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color(0xff2E429E)),
                              borderRadius: BorderRadius.circular(100),
                            ),

                          ),
                        ),
                      ),
                    ),



                  ),
                  Padding(
                    padding: EdgeInsets.only(right:5, top: screenHeight * 0.05), // 40% of screen width, 5% of screen height
                    child: RichText(
                      text: const TextSpan(children: [
                        TextSpan(
                          text: 'Password reset Successfull',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                            color: Color(0xff252B5C),
                          ),
                        ),

                      ]),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(right: 20, top: 15),
                    child: Text(
                      "Congratulation's your password has",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Color(0xff53587A)),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 30, top: 10),
                    child: Text(
                      'been Updated Successfully!',
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
                              MaterialPageRoute(builder: (context) => const LoginOne()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            SizedBox(width: screenWidth * 0.02), // Responsive spacing
                            Text(
                              'Log In',
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
