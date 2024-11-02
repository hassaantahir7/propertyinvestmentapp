import 'package:flutter/material.dart';
import 'package:property_investment_app/login_one.dart';


class SplashScreenThree extends StatelessWidget {
  const SplashScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Adjusted Padding for Skip button
            Padding(
              padding: EdgeInsets.only(
                top: 50,
                right: 10,
                bottom: 30,
                left: 270,
              ),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginOne()));
                },
                child: Container(
                  height: size.height * 0.05, // 5% of screen height
                  width: size.width * 0.22, // 22% of screen width
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color(0xffDFDFDF),
                  ),
                  child: const Center(
                    child: Text(
                      'Skip',
                      style: TextStyle(fontFamily: 'Montserrat',color: Color(0xff000000)),
                    ),
                  ),
                ),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'List your property!',
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 7), // 2% from top
              child: Center(
                child: Text(
                  'Get verified buyers of your property ',
                  style: TextStyle(
                    color: Color(0xff3D3D3D),
                    fontWeight: FontWeight.w500,
                    fontSize: 16.5, // Responsive font size
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                'with an easy to manage dashboard!',
                style: TextStyle(
                  color: Color(0xff3D3D3D),
                  fontWeight: FontWeight.w500,
                  fontSize: 16.5, // Responsive font size
                ),
              ),
            ),


            // Image container with progress bar and additional container
            Padding(
              padding: EdgeInsets.only(top: 46, bottom: 10),
              child: Container(
                height: 460, // 60% of screen height
                width: 340, // 85% of screen width
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  image: const DecorationImage(
image: AssetImage('assets/splash_screen_2.png'),                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Progress Bar
                    Padding(
                      padding: EdgeInsets.only(bottom:20),
                      child: SizedBox(
                        width: 70,
                        height: 3, // Width of the progress bar
                        child: LinearProgressIndicator(
                          borderRadius: BorderRadius.circular(5),
                          value: 0.66, // 66% progress
                          color: Colors.white, // Progress color
                          backgroundColor: Colors.grey,  // Background color
                        ),
                      ),
                    ),
                    // Additional container below the progress bar
                    Padding(
                      padding: EdgeInsets.only(bottom: 30),
                      child: Container(
                        height:54, // 6% of screen height
                        width: 190, // 50% of screen width
                        decoration: BoxDecoration(
                          color: const Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(50),
                        ), child: TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => LoginOne()));
                        },
                        child: const Center(
                          child: Text(
                            'Next',
                            style: TextStyle(color: Color(0xff2E429E),
                                fontFamily: 'Poppins',
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
