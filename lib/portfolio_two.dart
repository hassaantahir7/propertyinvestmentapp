import 'package:flutter/material.dart';
import 'package:property_investment_app/portfolio.dart';


class PortfolioTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTopRow(context),
              _buildAboutSection(),
              _buildPieChart(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: _buildSharesSection(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => PortfolioPage())),
            child: Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                color: Color(0xffFFFFFF),
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Color(0xffE8E6F9)),
              ),
              child: Icon(Icons.arrow_back, color: Color(0xff343333), size: 21),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Structural Work',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff0D0B0C),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow(Icons.home_work, 'Property Name', 'Skyline Towers'),
          SizedBox(height: 10),
          _buildInfoRow(Icons.location_city, 'Property Type', 'Residential (Condominium)'),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: _buildInfoRow(Icons.money_outlined, 'Price', '1M Aed')),
              Expanded(child: _buildInfoRow(Icons.fullscreen, 'Total Area', '3508,68 sq. ft')),
            ],
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
            children: [
              Expanded(child: _buildInfoText('Custodian', 'J.P. Morgan Chase & Co', '')),
              SizedBox(width: 15,),
              Expanded(child: _buildInfoText('Supervision', 'BNY Mellon', '')),
            ],
          ),

        ],
      ),
    );
  }

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

  Widget _buildInfoText(String label, String value, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 12, color: Color(0xff6A7380))),
        Text(value, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        if (description.isNotEmpty)
          Text(description, style: TextStyle(fontSize: 12, color: Color(0xff6A7380))),
      ],
    );
  }

  Widget _buildPieChart() {
    return Center(
      child: Container(
        width: 330,
        height: 330,
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
                    padding: const EdgeInsets.only(bottom: 270,),
                    child: _buildInfoRow(Icons.space_dashboard_rounded, 'Area Booked', '3508,68 sq.ft'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 270),
                    child: _buildInfoRow(Icons.space_dashboard_sharp, 'Area Left', '2308,68 sq.ft'),
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
      ),
    );
  }
}

  Widget _buildSharesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Shares', style: TextStyle(color: Color(0xFF323236), fontSize: 16, fontWeight: FontWeight.w500)),
        SizedBox(height: 16),
        _buildShareItem(),
        SizedBox(height: 16),
        _buildShareItem(),
        SizedBox(height: 16),
        _buildShareItem(),
      ],
    );
  }

Widget _buildShareItem() {
  return Container(
    height: 71,
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [BoxShadow(color: Color(0x0A000000), blurRadius: 10, offset: Offset(0, 5))],
    ),
    child: Row(
      children: [
        CircleAvatar(backgroundColor: Colors.grey[200], radius: 20),
        SizedBox(width: 16),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Sean Inc.', style: TextStyle(color: Color(0xFF323236), fontSize: 14, fontWeight: FontWeight.w500)),
            Text('SEAN', style: TextStyle(color: Color(0xFF83848B), fontSize: 12, fontWeight: FontWeight.w400)),
          ],
        ),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "\$245.89",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Color(0xff323236),
                    ),
                  ),
                  TextSpan(
                    text: '\n+1.43 (2%)',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff23B371),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

