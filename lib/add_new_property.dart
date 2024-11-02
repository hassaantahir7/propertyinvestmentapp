import 'package:flutter/material.dart';

class AddPropertyUI extends StatefulWidget {
  @override
  _AddPropertyUIState createState() => _AddPropertyUIState();
}

class _AddPropertyUIState extends State<AddPropertyUI>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedPropertyType = -1;

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

  Widget _buildBoxedTextFormField(String hintText, {Widget? suffixIcon}) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        border: Border.all(color: Color(0xFFE1E3E6)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          border: InputBorder.none,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }

  Widget _buildPropertyTypeButton(int index, IconData icon, String text) {
    bool isSelected = _selectedPropertyType == index;

    return GestureDetector(
      onTap: () => setState(() => _selectedPropertyType = index),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          border: Border.all(
            color: isSelected ? Color(0xFF2E429E) : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          children: [
            Icon(icon, color: isSelected ? Color(0xFF2E429E) : Color(0xFFA2A7AF)),
            SizedBox(height: 4),
            Text(
              text,
              style: TextStyle(color: isSelected ? Color(0xFF2E429E) : Color(0xFFA2A7AF)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabelWithStar(String label) {
    return Row(
      children: [
        Text(label),
        Text('*', style: TextStyle(color: Colors.red)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
        title: Row(
          children: [
            Expanded(child: Text('Add New Property')),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            child: TabBar(
              controller: _tabController,
              tabs: [
                Tab(text: 'Property Information'),
                Tab(text: 'Owner Information'),
              ],
              labelColor: Color(0xFF2E429E),
              unselectedLabelColor: Colors.grey[300],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildPropertyInformationTab(),
                _buildOwnerInformationTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPropertyInformationTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Property Type'),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(child: _buildPropertyTypeButton(0, Icons.apartment, 'Flats/Apartments')),
              SizedBox(width: 8),
              Expanded(child: _buildPropertyTypeButton(1, Icons.home, 'Independent Houses')),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(child: _buildPropertyTypeButton(2, Icons.business, 'Builder Floor')),
              SizedBox(width: 8),
              Expanded(child: _buildPropertyTypeButton(3, Icons.landscape, 'Residential Plot')),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(child: _buildPropertyTypeButton(4, Icons.business_center, 'Office Space')),
              SizedBox(width: 8),
              Expanded(child: _buildPropertyTypeButton(5, Icons.more_horiz, 'More')),
            ],
          ),
          SizedBox(height: 16),

          _buildLabelWithStar('State'),
          SizedBox(height: 8),
          _buildBoxedTextFormField('Select state', suffixIcon: Icon(Icons.arrow_drop_down)),
          SizedBox(height: 16),

          _buildLabelWithStar('Property Location'),
          SizedBox(height: 8),
          _buildBoxedTextFormField('Enter property location'),
          SizedBox(height: 16),

          Text('Project or Society Name'),
          SizedBox(height: 8),
          _buildBoxedTextFormField('Name of project/society'),
          SizedBox(height: 16),

          _buildLabelWithStar('Address'),
          SizedBox(height: 8),
          _buildBoxedTextFormField('Enter address'),
          SizedBox(height: 16),

          Text('Transaction Type, Property Availability', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),

          _buildLabelWithStar('Sale Type'),
          SizedBox(height: 8),
          _buildBoxedTextFormField('Select', suffixIcon: Icon(Icons.arrow_drop_down)),
          SizedBox(height: 8),

          _buildLabelWithStar('Ownership'),
          SizedBox(height: 8),
          _buildBoxedTextFormField('Select', suffixIcon: Icon(Icons.arrow_drop_down)),
          SizedBox(height: 8),

          _buildLabelWithStar('Number of Floors'),
          SizedBox(height: 8),
          _buildBoxedTextFormField('Select', suffixIcon: Icon(Icons.arrow_drop_down)),
          SizedBox(height: 8),

          _buildLabelWithStar('Availability'),
          SizedBox(height: 8),
          _buildBoxedTextFormField('Select', suffixIcon: Icon(Icons.arrow_drop_down)),
          SizedBox(height: 8),

          _buildLabelWithStar('Property on the Floor'),
          SizedBox(height: 8),
          _buildBoxedTextFormField('Select', suffixIcon: Icon(Icons.arrow_drop_down)),
          SizedBox(height: 8),

          _buildLabelWithStar('Possession By'),
          SizedBox(height: 8),
          _buildBoxedTextFormField('Possession date'),
          SizedBox(height: 16),

          Row(
            children: [
              Text('Property Feature & Price', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(width: 8),
              Icon(Icons.calculate, color: Color(0xFF2E429E)),
              Text('Calculator', style: TextStyle(color: Color(0xFF2E429E))),
            ],
          ),
          SizedBox(height: 16),

          Text('Built Up Area', style: TextStyle(fontWeight: FontWeight.bold)),
          Icon(Icons.info, color: Color(0xFF2E429E)),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(child: _buildBoxedTextFormField('Built up area')),
              SizedBox(width: 8),
              Expanded(child: _buildBoxedTextFormField('Area unit', suffixIcon: Icon(Icons.arrow_drop_down))),
            ],
          ),
          SizedBox(height: 16),

          Text('Carpet Area', style: TextStyle(fontWeight: FontWeight.bold)),
          Icon(Icons.info, color: Color(0xFF2E429E)),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(child: _buildBoxedTextFormField('Carpet area')),
              SizedBox(width: 8),
              Expanded(child: _buildBoxedTextFormField('Area unit', suffixIcon: Icon(Icons.arrow_drop_down))),
            ],
          ),
          SizedBox(height: 16),

          Text('Super Area', style: TextStyle(fontWeight: FontWeight.bold)),
          Icon(Icons.info, color: Color(0xFF2E429E)),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(child: _buildBoxedTextFormField('Super area')),
              SizedBox(width: 8),
              Expanded(child: _buildBoxedTextFormField('Area unit', suffixIcon: Icon(Icons.arrow_drop_down))),
            ],
          ),
          SizedBox(height: 16),

          Text('Plot / Land Area', style: TextStyle(fontWeight: FontWeight.bold)),
          Icon(Icons.info, color: Color(0xFF2E429E)),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(child: _buildBoxedTextFormField('Plot / land area')),
              SizedBox(width: 8),
              Expanded(child: _buildBoxedTextFormField('Area unit', suffixIcon: Icon(Icons.arrow_drop_down))),
            ],
          ),
          SizedBox(height: 16),

          _buildLabelWithStar('Expected Price'),
          SizedBox(height: 8),
          _buildBoxedTextFormField('Enter Total Price'),
          SizedBox(height: 16),

          Text('Booking Amount', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          _buildBoxedTextFormField('Enter Booking Amount'),
          SizedBox(height: 16),

          Text('Maintenance Charges', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          _buildBoxedTextFormField('Enter Maintenance Charges'),
          SizedBox(height: 16),

          _buildLabelWithStar('No. of Bedrooms'),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(child: _buildBoxedTextFormField('1 RK')),
              SizedBox(width: 8),
              Expanded(child: _buildBoxedTextFormField('1 BHK')),
              SizedBox(width: 8),
              Expanded(child: _buildBoxedTextFormField('2 BHK')),
              SizedBox(width: 8),
              Expanded(child: _buildBoxedTextFormField('3 BHK')),
              SizedBox(width: 8),
              Expanded(flex: 2, child: _buildBoxedTextFormField('More', suffixIcon: Icon(Icons.arrow_drop_down))),
            ],
          ),
          SizedBox(height: 16),

          _buildLabelWithStar('No. of Balconies'),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(child: _buildBoxedTextFormField('1')),
              SizedBox(width: 8),
              Expanded(child: _buildBoxedTextFormField('2')),
              SizedBox(width: 8),
              Expanded(child: _buildBoxedTextFormField('3')),
              SizedBox(width: 8),
              Expanded(child: _buildBoxedTextFormField('4')),
              SizedBox(width: 8),
              Expanded(flex: 2, child: _buildBoxedTextFormField('More', suffixIcon: Icon(Icons.arrow_drop_down))),
            ],
          ),
          SizedBox(height: 16),

          Text('Property Description', style: TextStyle(fontWeight: FontWeight.bold)),
          Icon(Icons.info, color: Color(0xFF2E429E)),
          SizedBox(height: 8),
          _buildBoxedTextFormField('Maximum 2000 characters'),
          SizedBox(height: 8),
          Text('Tell us more about the property, what makes it stand out? (2000/2000)'),
          SizedBox(height: 16),

          Container(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              child: Text('Submit Property'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color(0xFF2E429E),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOwnerInformationTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Property Name'),
          SizedBox(height: 8),
          _buildBoxedTextFormField('House'),
          SizedBox(height: 16),

          Text('Property Type'),
          SizedBox(height: 8),
          _buildBoxedTextFormField('Select', suffixIcon: Icon(Icons.arrow_drop_down)),
          SizedBox(height: 16),

          Text('Listing Price'),
          SizedBox(height: 8),
          _buildBoxedTextFormField('Percentage input'),
          SizedBox(height: 16),

          Text('Rental Yield (If Rented)'),
          SizedBox(height: 8),
          _buildBoxedTextFormField('Percentage input'),
          SizedBox(height: 16),

          Text('Expected ROI (Annual)'),
          SizedBox(height: 8),
          _buildBoxedTextFormField('Currency input'),
          SizedBox(height: 16),

          Text('Property Taxes'),
          SizedBox(height: 8),
          _buildBoxedTextFormField('Currency input or Percentage of Property Value'),
          SizedBox(height: 16),

          Text('Expected Holding Period'),
          SizedBox(height: 8),
          _buildBoxedTextFormField('Select Years', suffixIcon: Icon(Icons.arrow_drop_down)),
          SizedBox(height: 16),

          Text('Break-Even Point'),
          SizedBox(height: 8),
          _buildBoxedTextFormField('3 Years'),
          SizedBox(height: 16),

          Text('Maintenance Costs'),
          SizedBox(height: 8),
          _buildBoxedTextFormField('Annual or Monthly'),
          SizedBox(height: 16),

          Text('Financing Options'),
          SizedBox(height: 8),
          _buildBoxedTextFormField('Cash, Mortgage, Seller Financing'),
          SizedBox(height: 16),

          Text('Exit Strategy'),
          SizedBox(height: 8),
          _buildBoxedTextFormField('SALE AFTER 5 YEARS, REFINANCING'),
          SizedBox(height: 16),

          Text('Property Condition'),
          SizedBox(height: 8),
          _buildBoxedTextFormField('NEW, Renovated, Needs Renovation'),
          SizedBox(height: 16),

          Text('Break-Even Points'),
          SizedBox(height: 8),
          _buildBoxedTextFormField('3 Years'),
          SizedBox(height: 16),

          Container(
            width: 160,
            height: 60,
            child: ElevatedButton(
              child: Text('Submit Property'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color(0xFF2E429E),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}