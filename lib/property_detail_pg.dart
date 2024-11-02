import 'package:flutter/material.dart';
import 'package:property_investment_app/home_screen_1.dart';
import 'package:property_investment_app/start_investment.dart';

class PropertyDetailsPage extends StatefulWidget {
  @override
  _PropertyDetailsPageState createState() => _PropertyDetailsPageState();
}

class _PropertyDetailsPageState extends State<PropertyDetailsPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              // Property Image and Price Tag with Icons
              Padding(
                padding: const EdgeInsets.only(top: 7, left: 5, right: 4),
                child: Stack(
                  children: [
                    _buildPropertyCard(context),
                    SizedBox(height: 16),
                  ],
                ),
              ),

              // Custom Tab Buttons with Padding and Tab Bar Line
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildTabButton('About', _selectedIndex == 0, 0),
                          SizedBox(width: 7),
                          _buildTabButton('Details', _selectedIndex == 1, 1),
                          SizedBox(width: 7),
                          _buildTabButton('Location', _selectedIndex == 2, 2),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    Container(
                      height: 1.5,
                      color: Colors.grey.shade200, // Light gray line
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2),

              // Section based on selected index
              Expanded(
                child: _buildSelectedSection(),
              ),

              // New Start Investment Container at the bottom
            ],
          ),
        ),

    );
  }

  Widget _buildPropertyCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0.1),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image and Price Tag
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                ),
                child: Image.asset(
                  'assets/home_screen_1.png',
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 12,
                left: 12,
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.arrow_back, color: Color(0xff343333)),
                  ),
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.favorite_border, color: Color(0xff343333)),
                ),
              ),
              Positioned(
                bottom: 12,
                right: 12,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.75),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    '2000 AED',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(String title, bool isSelected, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? Color(0xff2E429E) : Colors.grey[300],
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSelectedSection() {
    switch (_selectedIndex) {
      case 0:
        return _buildAboutSection();
      case 1:
        return _buildDetailsSection();
      case 2:
        return _buildLocationSection();
      default:
        return _buildAboutSection();
    }
  }

  // About Section
  Widget _buildAboutSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          _buildInfoRow(Icons.home_work, 'Property Name', 'Skyline Towers'),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: _buildInfoRow(Icons.location_city, 'Property Type',
                'Residential (Condominium)'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 19),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildInfoRow(Icons.money_outlined, 'Price', '1M Aed'),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: _buildInfoRow(
                      Icons.fullscreen, 'Total Area', '3508,68 sq. ft'),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          _buildInfoText(
            'Fund Type',
            'Equity Funds',
            'Invests primarily in stocks, aiming for long-term capital growth. Suitable for investors with a higher risk appetite.',
          ),
          SizedBox(height: 16),
          _buildInfoText(
            'Investment Strategy',
            'Income Investing',
            'Focuses on generating regular income through dividends or interest from stable, income-producing assets like bonds or dividend-paying stocks.',
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildInfoText('Custodian', 'J.P. Morgan Chase & Co', ''),
              _buildInfoText('Supervision', 'BNY Mellon', ''),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30,left: 30),
            child: Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xff2E429E)),
              child: Center(
                  child: Text(
                'Start Investment',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffFFFFFF)),
              )),
            ),
          )
        ],
      ),
    );
  }

  // Details Section
  Widget _buildDetailsSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildInfoRow(Icons.attach_money, 'Total Raised', '1M Aed'),
              _buildInfoRow(Icons.swap_horiz, 'Total Transactions', '1M Aed'),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildInfoRow(Icons.money, 'Avg. Investment', '1M Aed'),
              _buildInfoRow(Icons.attach_money, 'Largest Investment', '1M Aed'),
            ],
          ),
          SizedBox(height: 16),
          _buildAreaInfoCard(),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildInfoRow(Icons.calendar_today, 'Started on', '12 Sep 2024'),
              _buildInfoRow(Icons.calendar_today, 'Expected Duration', '4.5 Years'),
            ],
          ),
          SizedBox(height: 16),
          // Pie chart section (Dummy for now)
          Center(
            child: Column(
              children: [

                SizedBox(height: 16),
                _buildPieChart(),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  width: 270,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0xff2E429E)),
                  child: Center(
                      child: Text(
                        'Start Investment',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffFFFFFF)),
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Location Section with Image Container
  Widget _buildLocationSection() {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              height: 320,
              width: 320,
              decoration: BoxDecoration(
                  color: Colors.grey[300], // Placeholder color
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      image: AssetImage('assets/property_location.png'))),
            ),
          ),
        ), Padding(
          padding: const EdgeInsets.only(top: 20),
          child: GestureDetector(onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => StartInvestment()));
          },
            child: Container(
              height: 50,
              width: 270,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xff2E429E)),
              child: Center(
                  child: Text(
                    'Start Investment',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffFFFFFF)),
                  )),
            ),
          ),
        )
      ],
    );
  }

  // Widget to build each information row with an icon
  Widget _buildInfoRow(IconData icon, String title, String value) {
    return Row(
      children: [
        Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xffF0F0F0)),
            child: Center(child: Icon(icon, color: Color(0xff6A7380)))),
        SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 12, color: Colors.grey)),
            Text(value,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ],
        ),
      ],
    );
  }

  // Widget to build text block for longer details (Fund Type, Investment Strategy, etc.)
  Widget _buildInfoText(String title, String subtitle, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(
                fontSize: 16,
                color: Color(0xff0D0B0C),
                fontWeight: FontWeight.w600)),
        Text(subtitle,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 13,
                color: Color(0xff000929))),
        if (description.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              description,
              style: TextStyle(color: Colors.grey),
            ),
          ),
      ],
    );
  }

  // Widget to build Area information card (Total Area, Total Sold, etc.)
  Widget _buildAreaInfoCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      color: Color(0xff2E429E),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 50,top: 17),
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Color(0xffF0F0F0),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Icon(
                              Icons.fullscreen,
                              color: Color(0xff505050),
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30,top: 10),
                        child: Text(
                          'Total Area',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffFFFFFF)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5,top: 10),
                        child: Text(
                          '3508,68 sq. ft',
                          style: TextStyle(
                           color: Color(0xffFFFFFF),   fontWeight: FontWeight.w600, fontSize: 14),
                        ),
                      ),
                    ],
                  ),


                ),  SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left:10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          _buildInfoRow(
                              Icons.fullscreen, 'Total Left', '3508,68 sq. ft'),SizedBox(height: 10,),
                          _buildInfoRow(
                              Icons.fullscreen, 'Total Left', '3508,68 sq. ft')
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }

  // Widget to simulate a pie chart (Placeholder for now)
  Widget _buildPieChart() {
    return Container(
      width: 350,
      height: 350,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.grey[200],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [

          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 280),
                  child: _buildInfoRow(Icons.space_dashboard_rounded, 'Started on', '12 Sep 2024'),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 270),
                  child: _buildInfoRow(Icons.space_dashboard_sharp, 'Expected Duration', '4.5 Years'),
                ),
              ],
            ),
          ),
SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: SizedBox(
              width: 160,
              height: 160,
              child: CircularProgressIndicator(
                value: 0.6,
                strokeWidth: 56,
                backgroundColor: Color(0xff6FD195),
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xff7086FD)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20,left: 155),
            child: Text('60%',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,color: Color(0xffFFFFFF))),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30,right: 140),
            child: Text('40%',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,color: Color(0xffFFFFFF)) ),
          ),
        ],
      ),
    );
  }
}
