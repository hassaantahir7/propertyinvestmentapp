import 'package:flutter/material.dart';
import 'package:property_investment_app/login_two.dart';
import 'package:property_investment_app/register_one.dart';

class LoginOne extends StatelessWidget {
  const LoginOne({super.key});

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
              SizedBox(height: screenHeight * 0.01), // 1% of screen height
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ImageWidget(
                    assetPath: 'assets/login_thre_img.png',
                    size: screenWidth * 0.4,
                  ),
                  ImageWidget(
                    assetPath: 'assets/login_four_img.png',
                    size: screenWidth * 0.4,
                  ),
                ],
              ),

              // Login Button
              Padding(
                padding: EdgeInsets.only(right: screenWidth * 0.35, top: screenHeight * 0.05), // 40% of screen width, 5% of screen height
                child: RichText(
                  text: const TextSpan(children: [
                    TextSpan(
                      text: 'Ready to',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        color: Color(0xff252B5C),
                      ),
                    ),
                    TextSpan(
                      text: ' explore?',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w800,
                        color: Color(0xff6A7380),
                      ),
                    ),
                  ]),
                ),
              ),

              // Continue with Email
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.05), // 5% of screen height
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
                          MaterialPageRoute(builder: (context) => const LoginTwo()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.email_outlined,
                          color: Color(0xffFFFFFF),
                        ),
                        SizedBox(width: screenWidth * 0.02), // Responsive spacing
                        Text(
                          'Continue with Email',
                          style: TextStyle(
                            fontFamily: 'Poppins',
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

              const Padding(
                padding: EdgeInsets.only(top: 29, right: 15, left: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 2,
                        color: Color(0xffECEDF3),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'OR',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          color: Color(0xffA1A5C1),
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
                padding: EdgeInsets.only(top: screenHeight * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
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
                    SizedBox(width: screenWidth * 0.02), // Spacing between buttons
                    Container(
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
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.04),
                child: GestureDetector(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterOne()));
                },
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "Don't have an account?",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            color: Color(0xff53587A),
                          ),
                        ),
                        TextSpan(
                          text: ' Register',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Poppins',
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
