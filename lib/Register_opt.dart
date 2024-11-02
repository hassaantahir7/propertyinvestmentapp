import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterOpt extends StatelessWidget {
  const RegisterOpt({Key? key}) : super(key: key);

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
                    padding: EdgeInsets.only(right: 205, top: screenHeight * 0.05), // 40% of screen width, 5% of screen height
                    child: RichText(
                      text: const TextSpan(children: [
                        TextSpan(
                          text: 'Enter Code',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                            color: Color(0xff252B5C),
                          ),
                        ),

                      ]),
                    ),
                  ),  const Padding(
                    padding: EdgeInsets.only(right: 90, top: 15),
                    child: Text(
                      'Check your phone for the verification code',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xff53587A)),
                    ),


                  ),
                  SizedBox(height: 30,),
                  // Otp Input Fields
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(4, (index) {
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
                  SizedBox(height: 40,),
                  Container(
                    height: 50,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Color(0xffF5F4F8),
                      borderRadius: BorderRadius.circular(100),

                    ),
                    child: Center(child: Row(
                        children: [
                          Icon(  Icons.timer_outlined,color: Color(0xff252B5C),),
                          Text('  00:21',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Color(0xff252B5C)),)
                        ]),
                    ),
                  ),
                  SizedBox(height: 30,),
                  RichText(text: TextSpan(children:
                  [
                    TextSpan(
                        text: "Didn't receive the OTP?",style: TextStyle(fontWeight: FontWeight.w400,color: Color(0xff53587A),fontSize: 12)
                    ),
                    TextSpan(
                        text: ' Resend OTP',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700,color: Color(0xff234F68))
                    )
                  ]))
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
    );
  }
}