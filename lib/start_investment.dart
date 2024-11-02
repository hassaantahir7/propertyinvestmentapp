import 'package:flutter/material.dart';
import 'package:property_investment_app/home_screen_1.dart';
class StartInvestment extends StatefulWidget {
  const StartInvestment({super.key});

  @override
  State<StartInvestment> createState() => _StartInvestmentState();
}

class _StartInvestmentState extends State<StartInvestment> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(backgroundColor: Colors.white,body: SafeArea(
      child: Column(
        children: [
          Container(
            height: 430,
            width: 430,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/start_investment.png'),)
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "You have successfully\n Started Investment",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: Color(0xff2E429E),
                    ),
                  ),    ],
              ),
            ),
          ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                    },
                    child: Container(
                      height: 50,
                      width: 270,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color(0xff2E429E)),
                      child: Center(
                          child: Text(
                            'Back to Home',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffFFFFFF)),
                          )),
                    ),
                  ),
                ),

        ],
      ),
    ),);
  }
}
class PropertyFilterUI extends StatefulWidget {
  @override
  _PropertyFilterUIState createState() => _PropertyFilterUIState();
}

class _PropertyFilterUIState extends State<PropertyFilterUI> {
  RangeValues _priceRange = RangeValues(0, 10);
  RangeValues _squareFeetRange = RangeValues(0, 3200);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 300),
                  child: GestureDetector(
                   onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                   },
                    child: IconButton(
                      icon: Icon(Icons.close),
                      color: Color(0xff4B4B4B),
                      onPressed: () {
                        // Handle close action
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 2), // Placeholder for balance
                    Text(
                      'Property Filter',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 125),
                          child: TextButton(
                            child: Text('Reset all', style: TextStyle(color: Colors.blue)),
                            onPressed: () {
                              // Handle reset action
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 8),
                _buildSectionTitle('Location'),
                SizedBox(height: 10),
                _buildBoxedDropdown('Any area'),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 3),
                          _buildSectionTitle('Rental Period'),
                          SizedBox(height: 8),
                          CustomToggleButton(
                            options: ['Yearly', 'Monthly'],
                            onSelected: (index) {
                              // Handle selection
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionTitle('Property Type'),
                          SizedBox(height: 8),
                          CustomToggleButton(
                            options: ['Residential', 'Commercial'],
                            onSelected: (index) {
                              // Handle selection
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                _buildSectionTitle('Furnished Type'),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(right: 135),
                  child: CustomToggleButton(
                    options: ['Furnished', 'Unfurnished'],
                    onSelected: (index) {
                      // Handle selection
                    },
                  ),
                ),
                SizedBox(height: 16),
                _buildSectionTitle('Bathrooms'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: ['Any', '01', '02'].map((option) =>
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: ChoiceChip(
                          label: Text(option),
                          selected: false, // Manage state for selection
                          onSelected: (bool selected) {
                            // Handle selection
                          },
                          selectedColor: Color(0xffF2F4F7),
                          backgroundColor: Color(0xffF2F4F7),
                          labelStyle: TextStyle(fontSize: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      )
                  ).toList(),
                ),
                SizedBox(height: 16),
                _buildSectionTitle('Price range'),
                SizedBox(height: 8),

                Row(
                  children: [
                    Expanded(child: _buildBoxedTextFormField('Min')),
                    SizedBox(width: 16),
                    Expanded(child: _buildBoxedTextFormField('Max')),
                  ],
                ),   SizedBox(height: 8), Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$0'),
                    Text('\$10B'),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(''),
                    Expanded(
                      child: RangeSlider(
                        values: _priceRange,
                        min: 0,
                        max: 10,
                        divisions: 100,
                        labels: RangeLabels('\$${_priceRange.start.toStringAsFixed(0)}', '\$${_priceRange.end.toStringAsFixed(0)}'),
                        onChanged: (RangeValues values) {
                          setState(() {
                            _priceRange = values;
                          });
                        },
                      ),
                    ),
                    Text(''),
                  ],
                ),
                SizedBox(height: 16),
                _buildSectionTitle('Square feet'),
                SizedBox(height: 8,),
                Row(
                  children: [
                    Expanded(child: _buildBoxedTextFormField('Min')),
                    SizedBox(width: 16),
                    Expanded(child: _buildBoxedTextFormField('Max')),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$0'),
                    Text('\$3200'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: RangeSlider(
                        values: _squareFeetRange,
                        min: 0,
                        max: 3200,
                        divisions: 32,
                        labels: RangeLabels('${_squareFeetRange.start.toStringAsFixed(0)}', '${_squareFeetRange.end.toStringAsFixed(0)}'),
                        onChanged: (RangeValues values) {
                          setState(() {
                            _squareFeetRange = values;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                _buildSectionTitle('Year built'),SizedBox(height: 8,),
                Row(
                  children: [
                    Expanded(child: _buildBoxedDropdown('Min')),
                    SizedBox(width: 16),
                    Expanded(child: _buildBoxedDropdown('Max')),
                  ],
                ),
                SizedBox(height: 16),
                _buildSectionTitle('Amenities'),
                SizedBox(height: 8,),
                Wrap(
                  spacing: 2,
                  runSpacing: 8,
                  children: [
                    'Air conditioning', 'Assisted living', 'Disability Access',
                    'Controlled access', 'Cable Ready', 'Available now',
                    'College', 'Corporate', 'Elevator',
                    'Extra Storage', 'High speed internet', 'Garage', 'Pet allowed'
                  ].map((amenity) =>
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0.1),
                        child: FilterChip(
                          label: Text(amenity),
                          selected: false, // Manage state for selection
                          onSelected: (bool selected) {
                            // Handle selection
                          },
                          selectedColor: Color(0xffF2F4F7),
                          backgroundColor: Color(0xffF2F4F7),
                          labelStyle: TextStyle(fontSize: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      )
                  ).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(color: Color(0xFF98A0B4), fontSize: 14),
    );
  }

  Widget _buildBoxedTextFormField(String hintText) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffD0D5DD)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildBoxedDropdown(String hintText) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffD0D5DD)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          border: InputBorder.none,
        ),
        items: [], // Add your items here
        onChanged: (value) {},
      ),
    );
  }
}

class CustomToggleButton extends StatefulWidget {
  final List<String> options;
  final Function(int) onSelected;

  CustomToggleButton({required this.options, required this.onSelected});

  @override
  _CustomToggleButtonState createState() => _CustomToggleButtonState();
}

class _CustomToggleButtonState extends State<CustomToggleButton> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        widget.options.length,
            (index) => Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
              widget.onSelected(index);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
              decoration: BoxDecoration(
                color: _selectedIndex == index
                    ? Color(0xff2E429E)
                    : Color(0xffF2F4F7),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  widget.options[index],
                  style: TextStyle(
                    color: _selectedIndex == index
                        ? Colors.white
                        : Color(0xff98A0B4),
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
