import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:property_investment_app/onBoard_two.dart';

class SameScreen extends StatelessWidget {
  const SameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 370),
              child: Container(
                height: 38,
                width: 86,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color(0xffF5F4F8),
                ),
                child: Center(
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
            Padding(
              padding: const EdgeInsets.only(right: 215, top: 36),
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
              padding: const EdgeInsets.only(right: 240, top: 15),
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
                padding: const EdgeInsets.symmetric(vertical: 23),
                child: Stack(
                  children: [
                    Container(
                      height: 408,
                      width: 450,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.network(
                          'https://s3-alpha-sig.figma.com/img/1b7c/75c5/bb159103e133827e2a8d3e07d0a616ce?Expires=1729468800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=g2rhkV6APzjtoVtnz~qngIZQzJpW478MG~g9WMLG9SVcYiQrYPHU1~4XENceMBmSelUa4rvcKMuiGVD34UHRAhJzIZcobtppJzYFh78IKkOBnm2nVOwknkmlqA61DIO7BJlU6uMOyRfgkllrEjsAP2LuLaxg7sQRQwtLSOXI0f0WD7XG-y5bbcEfIOJ8UEn7iQbrRdUtDvnSGVvw0oHyDii~A0Cuu89Guipn7hU8H-aK~29vwT~~lUu3ER-qO68qXoIic-5CtwS4idhOVpgPng1tv3E0KHJbL~6RMBX-PEGsLJReSDDpcQO9oxwmjFSMr5xjOmt4RoZiWBAT8PrCFw__',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 300, left: 33),
                      child: Container(
                        width: 387,
                        height: 56,
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
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 23),
              child: AbsorbPointer(
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 30),
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
              padding: const EdgeInsets.only(top: 28),
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
SizedBox(height: 30,),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => OnBoardtwo()));
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
    );
  }
}