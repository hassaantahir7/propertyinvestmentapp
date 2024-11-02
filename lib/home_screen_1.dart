import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:property_investment_app/add_new_property.dart';
import 'package:property_investment_app/chart_prop.dart';
import 'package:property_investment_app/portfolio.dart';
import 'package:property_investment_app/property_detail_pg.dart';
import 'package:property_investment_app/property_wallet.dart';
import 'package:property_investment_app/settings.dart';
import 'package:property_investment_app/start_investment.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  List<Widget> _pages = [
    HomePage(), // Your main home screen
    PropertyWalletUI(), // Replace with your Wallet page
    Container(), // Placeholder for the central plus icon
    PortfolioPage(), // Your Portfolio page
    SettingsUI(), // Your Settings page
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: _pages[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddPropertyUI()));
        },
        child: Icon(
          Icons.add,
          color: Color(0xffFFFFFF),
        ),
        backgroundColor: Color(0xff2E429E),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.other_houses_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PropertyWalletUI()));
                },
                child: Icon(
                  Icons.account_balance_wallet_outlined,
                  color: Color(0xffA2A7AF),
                )),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddPropertyUI()));
                },
                child: Icon(Icons.add, color: Color(0xffFFFFFF))),
// Central plus icon
            label: '',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PortfolioPage()));
                },
                child: Icon(Icons.widgets_outlined)),
            label: 'Portfolio',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingsUI()));
                },
                child: Icon(Icons.settings_outlined)),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.items,
    this.currentIndex = 0,
    this.onTap,
  });

  final List<BottomNavigationBarItem> items;
  final int currentIndex;
  final ValueChanged<int>? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            spreadRadius: 0,
            blurRadius: 10,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: BottomNavigationBar(
          items: items,
          currentIndex: currentIndex,
          onTap: onTap,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xff2E429E),
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: 40,
                    width: 76,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Color(0xffFFFFFF)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 7,
                        ),
                        Icon(
                          Icons.location_on_sharp,
                          color: Color(0xff2E429E),
                          size: 20,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          'UAE',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              color: Color(0xff252B5C)),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Color(0xff2E429E),
                          size: 20,
                        )
                      ],
                    )),
                AbsorbPointer(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 125),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(50)),
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.notification_important_outlined,
                            color: Color(0xff252B5C),
                          ),
                          fillColor: const Color(0xffFFFFFF),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xff8BC83F)),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xffF5F4F8)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/profile_pic.png'),
                    radius: 20,
                  ),
                ),
              ],
            ),

            // Welcome Section
            Padding(
              padding: EdgeInsets.only(
                  left: 5,
                  top: screenHeight *
                      0.0250), // 40% of screen width, 5% of screen height
              child: RichText(
                text: const TextSpan(children: [
                  TextSpan(
                    text: 'Hey,',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Color(0xff252B5C),
                    ),
                  ),
                  TextSpan(
                      text: ' Nadeem!',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff234F68)))
                ]),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 5, top: 7.5),
              child: Text(
                "Let's start exploring",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Color(0xff53587A)),
              ),
            ),
            // Search Bar and Filters
            Padding(padding: EdgeInsets.only(top: 10)),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 19),
                      hintText: 'Search...',
                      suffixStyle: TextStyle(
                          color: Color(0xff828282),
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                      prefixIcon: Icon(
                        Icons.search_rounded,
                        color: Color(0xff2E429E),
                        size: 30,
                      ),
                      filled: true,
                      fillColor: Color(0xffFCFCFC),
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
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PropertyFilterUI()));
                  },
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PropertyFilterUI()));
                    },
                    icon: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PropertyFilterUI()));
                        },
                        child: Icon(
                          Icons.filter_list,
                          color: Color(0xff2E429E),
                        )),
                    label: Text(
                      'Filters',
                      style: TextStyle(color: Color(0xff252B5C)),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffFCFCFC),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 19, horizontal: 12),
                    ),
                  ),
                )
              ],
            ),

            SizedBox(height: 16),

            // Tab Options
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround, // Use spaceAround for equal spacing
              children: [
                _buildTabButton('All', true),
                _buildTabButton('Invest', false),
                _buildTabButton('Place a Bid', false),
              ],
            ),

            SizedBox(height: 16),

            // Property Cards
            _buildPropertyCard(context),
            SizedBox(height: 16),
            _buildPropertyCard(context),
            SizedBox(height: 16),
            _buildPropertyCard(context),
            SizedBox(height: 16),
            _buildPropertyCard(context),
            SizedBox(height: 16),
            _buildPropertyCard(context),
            SizedBox(height: 16),
            _buildPropertyCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTabButton(String title, bool isSelected) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16), // Adjust padding here
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
    );
  }

  Widget _buildPropertyCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PropertyDetailsPage()),
        );
      },
      child: Container(
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
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildDetailItem(Icons.flag_circle_outlined, 'Goal', 'Structural Work'),
                SizedBox(width: 40),
                _buildDetailItem(Icons.fullscreen, 'Total Area', '3508,68 sq. ft'),
              ],
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildDetailItem(Icons.person, 'Total Investor', '02'),
                SizedBox(width: 65),
                _buildDetailItem(Icons.price_change_outlined, 'Total Investment', '1M Aed'),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(IconData icon, String title, String subtitle) {
    return Row(
      children: [
        Icon(icon, size: 30, color: Colors.grey),
        SizedBox(width: 4),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 12, color: Colors.grey)),
            Text(subtitle, style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        )
      ],
    );
  }
}
