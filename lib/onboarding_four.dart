import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:property_investment_app/onBoard_three.dart';
import 'package:property_investment_app/onBoard_two.dart';
import 'package:property_investment_app/onboard_profile.dart';

import 'home_screen_1.dart';

class OnboardingFour extends StatelessWidget {
  const OnboardingFour({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
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
                                  builder: (context) => const OnBoardtwo()),
                            );
                          },
                          child: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Color(0xff3A3F67),
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 190),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                        },
                        child: Container(
                          height: 38,
                          width: 86,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Color(0xffF5F4F8),
                          ),
                          child: const Center(
                            child: Text(
                              'Skip',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff3A3F67)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 90, top: screenHeight * 0.03875),
                child: RichText(
                  text: const TextSpan(children: [
                    TextSpan(
                      text: 'Add Your',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                          color: Color(0xff252B5C)),
                    ),
                    TextSpan(
                        text: ' Location',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff252B5C)))
                  ]),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 115, top: screenHeight * 0.01875),
                child: Text(
                  'Share Your Location to Continue',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color(0xff53587A)),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 29,right: 18,top: 23),
                  child: Stack(
                    children: [
                      Container(
                        height: 308,
                        width: 308,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.asset(
                            'assets/map_img.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 225, left: 30,right: 25),
                        child: Container(
                          width: 347,
                          height: 48,
                          decoration: BoxDecoration(
                            color: const Color(0xff2E429E),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                              child: Text(
                                'slect on map',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffFFFFFF)),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: AbsorbPointer(
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 20),
                      prefixIcon: const Icon(Icons.location_on_rounded,
                          color: Color(0xff1F4C6B)),
                      hintText: 'Location Detail',
                      hintStyle: const TextStyle(
                        color: Color(0xffA1A5C1),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      suffixIcon: Icon(
                        Icons.chevron_right_rounded,
                        color: Color(0xffA1A5C1),
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

              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: 70,
                  height: 3, // Width of the progress bar
                  child: LinearProgressIndicator(
                      borderRadius: BorderRadius.circular(5),
                      value: 0.30, // 66% progress
                      color: Color(0xff1F4C6B), // Progress color
                      backgroundColor: Color(0xffF5F4F8) // Background color
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => OnboardProfile()));
                },
                child: Container(
                    height: 63,
                    width: 278,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xff2E429E)),
                    child: Center(
                      child: Text(
                        'Next',
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18,color: Color(0xffFFFFFF)),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}