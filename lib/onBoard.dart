import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:property_investment_app/home_screen_1.dart';
import 'package:property_investment_app/onBoard_two.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double paddingTop = size.height * 0.055; // Equivalent to ~45 on standard screen

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 45,
                right: size.width * 0.04, // ~15 equivalent,
                bottom: size.height * 0.028, // ~23 equivalent,
                left:size.width * 0.65, // ~250 equivalent,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                },

                child: Container(
                  height: size.height * 0.05, // 5% of screen height
                  width: size.width * 0.22, // 22% of screen width
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color(0xffF5F4F8),
                  ),
                  child: const Center(
                    child: Text(
                      'Skip',
                      style: TextStyle(color: Color(0xff3A3F67),fontFamily: 'Montserrat',fontSize: 12),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right:size.width * 0.26, ),// ~18 equivalent, ),
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
              padding:  EdgeInsets.only(right: size.width * 0.33, // ~135 equivalent
                top: size.height * 0.015,), // ~12 equivalent),
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
                padding: EdgeInsets.only(left: size.width * 0.076, // ~29 equivalent
                  right: size.width * 0.047, // ~18 equivalent
                  top: size.height * 0.028, // ~23 equivalent ),
                ),
                child: Stack(
                  children: [
                    Container(
                      height: size.width * 0.855, // Making square container relative to width
                      width: size.width * 0.855, // Making square container relative to width
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
                      padding: const EdgeInsets.only(top: 225, left: 15,right: 25),
                      child: Center(
                        child: Container(
                          width: size.width * 0.9638,
                          height:  size.height * 0.067, // ~48 equivalent,
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
                    ),
                  ],
                ),
              ),
            ),SizedBox(height: size.height * 0.024),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.070),
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
                width: size.width * 0.183, // ~70 equivalent,
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => OnBoardtwo()));
              },
              child: Container(
                  height: size.height * 0.087, // ~63 equivalent
                  width: size.width * 0.727, // ~278 equivalent
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
    );
  }
}