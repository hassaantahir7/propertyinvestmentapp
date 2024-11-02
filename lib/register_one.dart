import 'package:flutter/material.dart';
import 'package:property_investment_app/Register_opt.dart';
import 'package:property_investment_app/login_one.dart';
import 'package:property_investment_app/login_two.dart';

class RegisterOne extends StatelessWidget {
  const RegisterOne({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05), // 5% of screen width
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                // Login Button
                Padding(
                  padding: EdgeInsets.only(right: 105, top: screenHeight * 0.05), // 40% of screen width, 5% of screen height
                  child: RichText(
                    text: const TextSpan(children: [
                      TextSpan(
                        text: 'Creat Your Account',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                          color: Color(0xff252B5C),
                        ),
                      ),

                    ]),
                  ),
                ),  const Padding(
                  padding: EdgeInsets.only(right: 155, top: 15),
                  child: Text(
                    'Create Your Investor Account',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xff53587A)),
                  ),
                ),
        SizedBox(height: 30,),
                // Continue with Email
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.010, vertical: 13),
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 21),
                          prefixIcon: const Icon(Icons.person_outline, color: Color(0xff252B5C)),
                          hintText: 'Full name',
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

                ),SizedBox(height: 15,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.010),
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 21),
                          prefixIcon: const Icon(Icons.lock_outline_rounded, color: Color(0xff252B5C)),
                          hintText: 'Password',
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


                ),Padding(
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
                            MaterialPageRoute(builder: (context) => const RegisterOpt()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          SizedBox(width: screenWidth * 0.02), // Responsive spacing
                          Text(
                            'Register Now',
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


                const Padding(
                  padding: EdgeInsets.only(top: 35, right: 15, left: 15),
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
                  padding: EdgeInsets.only(top: screenHeight * 0.04,bottom: 8),
                  child: GestureDetector(onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginOne()));
                  },
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "Already have an Account?",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color(0xff53587A),
                            ),
                          ),
                          TextSpan(
                            text: ' Log In',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff9A49F2),
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
