import 'package:flutter/material.dart';
import 'package:property_investment_app/forget_pass.dart';
import 'package:property_investment_app/forget_pass3.dart';
import 'package:property_investment_app/login_one.dart';
import 'package:property_investment_app/register_one.dart';
class ForgetPassTwo extends StatefulWidget {
  const ForgetPassTwo({super.key});

  @override
  State<ForgetPassTwo> createState() => _ForgetPassTwoState();
}

class _ForgetPassTwoState extends State<ForgetPassTwo> {

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
                    padding: EdgeInsets.only(right: 120, top: screenHeight * 0.05), // 40% of screen width, 5% of screen height
                    child: RichText(
                      text: const TextSpan(children: [
                        TextSpan(
                          text: 'Check your email',
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
                      'We sent a reset link to contact@dscode.com',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Color(0xff53587A)),
                    ),
                  ),
              const Padding(
                padding: EdgeInsets.only(right: 10, top: 15),
                child: Text(
                  'enter 5 digit code that mentioned in the email',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Color(0xff53587A)),
                ),
                  ),
                  SizedBox(height: 30,),
                  // Otp Input Fields
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(5, (index) {
                        return  Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),

                              borderRadius: BorderRadius.circular(10),

                            ),


                            child: TextFormField(
                              decoration: InputDecoration(

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
                              keyboardType: TextInputType.phone,
                            )


                        );
                      }),
                    ),
                  ),
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
                              MaterialPageRoute(builder: (context) => const ForgetPassThree()));
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPass()));
                    },
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "Haven't got the email yet?",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: Color(0xff989898),
                              ),
                            ),
                            TextSpan(
                              text: ' Resend email',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff53587A),
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
