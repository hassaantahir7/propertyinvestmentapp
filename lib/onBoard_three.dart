import 'package:flutter/material.dart';
import 'package:property_investment_app/home_screen_1.dart';
import 'package:property_investment_app/login_two.dart';
import 'package:property_investment_app/onBoard_two.dart';
import 'package:property_investment_app/onboard_same.dart';
import 'package:property_investment_app/onboarding_four.dart';
import 'package:property_investment_app/same_screen.dart';

class Onboardthre extends StatelessWidget {
  const Onboardthre({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double screenWidth = size.width;
    final double screenHeight = size.height;

    // Calculate responsive values
    final double backButtonSize = screenWidth * 0.15; // 12% of screen width
    final double skipButtonWidth = screenWidth * 0.23; // 22% of screen width
    final double skipButtonHeight = screenHeight * 0.058; // 4.5% of screen height
    final double imageRowHeight = screenHeight * 0.15; // 15% of screen height

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.012),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.04),
                        child: Container(
                          height: backButtonSize,
                          width: backButtonSize,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(backButtonSize / 2),
                            color: const Color(0xffF5F4F8),
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const OnBoardtwo()),
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
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: screenWidth * 0.04),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                          },
                          child: Container(
                            height: skipButtonHeight,
                            width: skipButtonWidth,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: const Color(0xffF5F4F8),
                            ),
                            child: const Center(
                              child: Text(
                                'Skip',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff3A3F67)
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: screenWidth * 0.28,
                        top: screenHeight * 0.035
                    ),
                    child: RichText(
                      text: const TextSpan(children: [
                        TextSpan(
                          text: 'Add Your',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 25,
                              color: Color(0xff252B5C)
                          ),
                        ),
                        TextSpan(
                            text: ' Location',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff252B5C)
                            )
                        )
                      ]),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: screenWidth * 0.35,
                        top: screenHeight * 0.02
                    ),
                    child: const Text(
                      'Share Your Location to Continue',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xff53587A)
                      ),
                    ),
                  ),

                  // Image grid with responsive sizing
                  ...List.generate(8, (index) => [
                    SizedBox(height: screenHeight * 0.002),
                    _buildImageRow(
                      context,
                      index,
                      screenWidth,
                      imageRowHeight,
                    ),
                  ]).expand((element) => element).toList(),

                ],
              ),
            ),
            Positioned(
              left: screenWidth * 0.2,
              right: screenWidth * 0.2,
              bottom: screenHeight * 0.03,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OnboardingFour())
                  );
                },
                child: Container(
                  height: screenHeight * 0.080,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color(0xff2E429E),
                  ),
                  child: const Center(
                    child: Text(
                      "Show more",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageRow(BuildContext context, int rowIndex, double screenWidth, double height) {
    final List<List<ImageInfo>> imageRows = [
      [
        ImageInfo('assets/Image_list_1.png', 0.25),
        ImageInfo('assets/onboard_list_2.png', 0.25),
        ImageInfo('assets/onboard_list_3.png', 0.19),
        ImageInfo('assets/onboard_list_4.png', 0.22),
      ],
      [
        ImageInfo('assets/row2_onboard_list_1.png', 0.26),
        ImageInfo('assets/row2_onboard_list_2.png', 0.35),
        ImageInfo('assets/row2_onboard_list_3.png', 0.25),
      ],
      [
        ImageInfo('assets/row2_onboard_list_4.png', 0.25),
        ImageInfo('assets/row3_onboard_list_2.png', 0.25),
        ImageInfo('assets/row3_onboard_list_3.png', 0.26),
        ImageInfo('assets/row3_onboard_list_3.png', 0.13),
      ],
      [
        ImageInfo('assets/row2_onboard_list_1.png', 0.26),
        ImageInfo('assets/row2_onboard_list_2.png', 0.38),
        ImageInfo('assets/row2_onboard_list_3.png', 0.28),
      ],
      [
        ImageInfo('assets/row2_onboard_list_2.png', 0.35),
        ImageInfo('assets/row3_onboard_list_3.png', 0.11),
        ImageInfo('assets/Image_list_1.png', 0.25),
        ImageInfo('assets/onboard_list_4.png', 0.19),
      ],
      [
        ImageInfo('assets/row3_onboard_list_2.png', 0.25),
        ImageInfo('assets/row2_onboard_list_1.png', 0.26),
        ImageInfo('assets/row2_onboard_list_3.png', 0.25),
        ImageInfo('assets/onboard_list_3.png', 0.19),
      ],
      [
        ImageInfo('assets/row2_onboard_list_1.png', 0.26),
        ImageInfo('assets/row2_onboard_list_2.png', 0.38),
        ImageInfo('assets/row2_onboard_list_3.png', 0.28),
      ],
      [
        ImageInfo('assets/row2_onboard_list_4.png', 0.25),
        ImageInfo('assets/row3_onboard_list_2.png', 0.25),
        ImageInfo('assets/row3_onboard_list_3.png', 0.26),
        ImageInfo('assets/row3_onboard_list_3.png', 0.13),
      ],

    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ...imageRows[rowIndex].map((imageInfo) => Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.005),
          child: ImageContainer(
            imageUrl: imageInfo.url,
            width: screenWidth * imageInfo.widthFactor,
            height: height,
          ),
        )),
      ],
    );
  }
}

class ImageContainer extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;

  const ImageContainer({
    required this.imageUrl,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Image.asset(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}

class ImageInfo {
  final String url;
  final double widthFactor;

  ImageInfo(this.url, this.widthFactor);
}