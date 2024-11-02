import'package:flutter/material.dart';
import 'package:property_investment_app/home_screen_1.dart';
import 'package:property_investment_app/onBoard.dart';
import'package:property_investment_app/onBoard_two.dart';
import 'package:property_investment_app/onboarding_four.dart';

import 'onBoard_three.dart';

class OnBoardtwo extends StatefulWidget {
  const OnBoardtwo({super.key});

  @override
  State<OnBoardtwo> createState() => _OnBoardtwoState();
}

class _OnBoardtwoState extends State<OnBoardtwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
        'assets/map_2.png',
              fit:
              BoxFit.cover, // This will make the image cover the whole screen
              width: double.infinity,
              height: double.infinity,
            ),
            SingleChildScrollView(
              child: Column(
                  children: [

                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
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
                                      builder: (context) => OnBoard()),
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
                        Padding(
                          padding: const EdgeInsets.only(left: 195),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                            },
                            child: Container(
                              height: 38,
                              width: 86,
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
                                      color: Color(0xff3A3F67)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: AbsorbPointer(
                        child: Container(
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xff1F4C6B80),
                                  spreadRadius: 40,
                                  blurRadius: 11,
                                  offset: Offset(2, 21)),
                            ],
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              contentPadding:
                              const EdgeInsets.symmetric(vertical: 21),
                              prefixIcon: const Icon(Icons.search_sharp,
                                  color: Color(0xff252B5C)),
                              hintText: 'Find location',
                              hintStyle: const TextStyle(
                                color: Color(0xffA1A5C1),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                              suffixIcon: const Icon(
                                Icons.settings_voice,
                                color: Color(0xffA1A5C1),
                              ),
                              fillColor: const Color(0xffFFFFFF),
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                const BorderSide(color: Color(0xffF5F4F8)),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                const BorderSide(color: Color(0xffF5F4F8)),
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 20, right: 235),
                      child: Padding(
                        padding: EdgeInsets.only(top: 45, left: 10),
                        child: Icon(
                          Icons.location_on_sharp,
                          color: Color(0xff234F68),
                          size: 45,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 230, top: 40),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: const Color(0xff1F4C6B)),
                        child: const Icon(
                          Icons.share_location_outlined,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 13),
                      child: Container(
                        height: 123,
                        width: 310,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: const Color(0xffFFFFFF),
                            boxShadow: [
                              const BoxShadow(
                                  color: Color(0xff1F4C6B80),
                                  spreadRadius: 40,
                                  blurRadius: 11,
                                  offset: Offset(2, 21))
                            ]),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 160, top: 15),
                              child: Text(
                                'Location detail',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff252B5C)),
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 17, top: 13),
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: const Color(0xffECEDF3)),
                                    child: const Icon(
                                      Icons.location_on_outlined,
                                      color: Color(0xff53587A),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                    left: 20,
                                  ),
                                  child: Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Srengseng, Kembangan, West Jakarta',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Color(
                                                  0xff53587A)), // Adjust style as needed
                                        ),
                                        TextSpan(
                                          text: '\nCity, Jakarta 11630',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Color(
                                                  0xff53587A)), // Adjust style as needed
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 60),
                      child: GestureDetector(
                       onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context) => Onboardthre()));
                       },
                        child: Container(
                            height: 53,
                            width: 258,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: const Color(0xff2E429E)),
                            child: const Center(
                              child: Text(
                                'Choose your location',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffFFFFFF)),
                              ),
                            )),
                      ),
                    )
                  ],
                ),
            ),

          ],
        ),
      ),
    );
  }
}