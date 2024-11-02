import 'package:flutter/material.dart';
import 'package:property_investment_app/home_screen_1.dart';
import 'package:property_investment_app/portfolio_two.dart';
import 'package:property_investment_app/property_details_page.dart'; // Add this import

class PortfolioPage extends StatefulWidget {
  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title:


     Padding(
      padding: const EdgeInsets.only(left:70),
      child: Text(
                    'Portfolio',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff0D0B0C),
                    ),
                  ),
    ),



      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TabBar Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                _buildTabItem('Popular Property', 0, 146),  // Smaller container for Popular Property
                SizedBox(width: 10),
                _buildTabItem('Most Visited Property', 1, 172), // Bigger container for Most Visited Property
              ],
            ),
          ),

          // Add space between TabBar and Cards
          SizedBox(height: 16),

          // Property Cards
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemCount: 3, // Add as many property cards as you need
                  itemBuilder: (context, index) => _buildPropertyCard(context),
                ),
                ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) => _buildPropertyCard(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem(String label, int index, double width) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
          _tabController.animateTo(index); // Ensure tab switch when tapping
        });
      },
      child: Container(
        height: 40,
        width: width,
        decoration: BoxDecoration(
          color: _selectedIndex == index ? Color(0xff2E429E) : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: _selectedIndex == index ? Color(0xffFFFFFF) : Color(0xff6A7380),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPropertyCard(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => PortfolioTwo()));
      },

      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Padding(
                padding: EdgeInsets.only(left: 13),
                child: Row(
                  children: [
                    _buildDetailItem(Icons.flag_circle_outlined, 'Goal', 'Structural Work'),
                    SizedBox(width: 40),
                    _buildDetailItem(Icons.fullscreen, 'Total Area', '3508,68 sq. ft'),
                  ],
                ),
              ),
              SizedBox(height: 12),
              Padding(
                padding: EdgeInsets.only(left: 13),
                child: Row(
                  children: [
                    _buildDetailItem(Icons.person, 'Total Investor', '02'),
                    SizedBox(width: 65),
                    _buildDetailItem(Icons.price_change_outlined, 'Total Investment', '1M Aed'),
                  ],
                ),
              ),
              SizedBox(height: 10),
            ],
          ),

      ),
    );
  }

  Widget _buildDetailItem(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Color(0xff6A7380), size: 18),
        SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: TextStyle(fontSize: 12, color: Color(0xff6A7380))),
            Text(value, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }
}

// Dummy property details page
