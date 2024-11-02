import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:property_investment_app/home_screen_1.dart';

class PropertyWalletUI extends StatefulWidget {
  @override
  _PropertyWalletUIState createState() => _PropertyWalletUIState();
}

class _PropertyWalletUIState extends State<PropertyWalletUI> with SingleTickerProviderStateMixin {
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
               padding: const EdgeInsets.only(left: 60),
               child: Text(
                'Property Wallet',
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                _buildTabItem('Total Investment', 0, 145),
                SizedBox(width: 10),
                _buildTabItem('Total Loss', 1, 110),
              ],
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildTotalInvestmentTab(),
                _buildTotalLossTab(),
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
          _tabController.animateTo(index);
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

  Widget _buildTotalInvestmentTab() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildWalletInfoRow(),
            SizedBox(height: 35),
            _buildChartSection(),
            SizedBox(height: 12),
            _buildSharesSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildWalletInfoRow() {
    return Row(
      children: [
        Expanded(
          child: _buildWalletInfoCard(
            icon: Icons.account_balance_wallet_outlined,
            title: 'Currency',
            amount: 'AED 20,32',
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: _buildWalletInfoCard(
            icon: Icons.stacked_bar_chart_outlined,
            title: 'Shares',
            amount: 'AED 15,50',
          ),
        ),
      ],
    );
  }

  Widget _buildWalletInfoCard({required IconData icon, required String title, required String amount}) {
    return Container(
      height: 80,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF2E429E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, color: Color(0xffA6B2F0), size: 30),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title, style: TextStyle(color: Color(0xffE6EAFF).withOpacity(0.8), fontSize: 14)),
              SizedBox(height: 2),
              Text(amount, style: TextStyle(color: Color(0xffFFFFFF), fontSize: 16, fontWeight: FontWeight.w500)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChartSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Chart', style: TextStyle(color: Color(0xFF323236), fontSize: 16, fontWeight: FontWeight.w500)),
        SizedBox(height: 16),
        Container(
          height: 278,
          width: double.infinity,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(color: Color(0x0A000000), blurRadius: 10, offset: Offset(0, 5))],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Last Week', style: TextStyle(color: Color(0xFF323236), fontSize: 14, fontWeight: FontWeight.w500)),
              Text('+32.3 (9%)', style: TextStyle(color: Color(0xFF23B371), fontSize: 12, fontWeight: FontWeight.w400)),
              SizedBox(height: 16),
              Expanded(child: _buildLineChart()),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: ['10 Aug', '11 Aug', '12 Aug', '13 Aug', '14 Aug', '15 Aug'].map((date) =>
                    Text(date, style: TextStyle(color: Color(0xFF83848B), fontSize: 12, fontWeight: FontWeight.w500))
                ).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLineChart() {
    return LineChart(
      LineChartData(
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        minX: 0,
        maxX: 5,
        minY: 0,
        maxY: 6,
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, 3),
              FlSpot(1, 4),
              FlSpot(2, 3.5),
              FlSpot(3, 5),
              FlSpot(4, 3),
              FlSpot(5, 4),
            ],
            isCurved: true,
            color: Color(0xFF23B371),
            barWidth: 2,
            isStrokeCapRound: true,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(show: true, color: Color(0xFF23B371).withOpacity(0.1)),
          ),
        ],
      ),
    );
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

  Widget _buildTotalLossTab() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildChartSection(),
            SizedBox(height: 24),
            _buildPriceContainer(),
            SizedBox(height: 16),
            _buildPriceContainer(),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceContainer() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Color(0x0A000000), blurRadius: 10, offset: Offset(0, 5))],
      ),
      child: Column(
        children: [
          _buildPriceItem(),
          SizedBox(height: 16),
          _buildPriceItem(),
        ],
      ),
    );
  }

  Widget _buildPriceItem() {
    return Container(
      height: 71,
      child: const Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Price', style: TextStyle(color: Color(0xFF323236), fontSize: 14, fontWeight: FontWeight.w500)),
              Text('Per Share', style: TextStyle(color: Color(0xFF83848B), fontSize: 12, fontWeight: FontWeight.w400)),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('\$872.75', style: TextStyle(color: Color(0xFF323236), fontSize: 18, fontWeight: FontWeight.w500)),
              Text('-12.34 (9.82%)', style: TextStyle(color: Color(0xFFE63E3E), fontSize: 12, fontWeight: FontWeight.w400)),
            ],
          ),
        ],
      ),
    );
  }
}