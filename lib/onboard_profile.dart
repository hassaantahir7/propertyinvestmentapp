import 'package:flutter/material.dart';

import 'home_screen_1.dart';
import 'onboarding_four.dart';

class OnboardProfile extends StatefulWidget {
  const OnboardProfile({Key? key}) : super(key: key);

  @override
  _OnboardProfileState createState() => _OnboardProfileState();
}

class _OnboardProfileState extends State<OnboardProfile> {
  Set<int> _selectedIndices = {};

  final List<Map<String, dynamic>> _realEstateTypes = [
    {'name': 'Apartment', 'image': 'assets/container_1.png'},
    {'name': 'Villa', 'image': 'assets/container_2.png'},
    {'name': 'House', 'image': 'assets/container_3.png'},
    {'name': 'Cottage', 'image': 'assets/container_4.png'},
    {'name': 'House', 'image': 'assets/container_5.png'},
    {'name': 'House', 'image': 'assets/container_6.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: _buildHeader(),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildTitle(),
                          const SizedBox(height: 8),
                          _buildSubtitle(),
                          const SizedBox(height: 24),
                          _buildRealEstateTypeGrid(),
                          // Add bottom padding to account for the floating navigation
                          const SizedBox(height: 100),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Floating bottom navigation
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _buildBottomNavigation(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => OnboardingFour()));
          },
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: const Color(0xFFF5F4F8),
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Icon(Icons.arrow_back_ios_new_rounded, size: 13, color: Color(0xFF252B5C)),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
          child: Container(
            height: 38,
            width: 86,
            decoration: BoxDecoration(
              color: const Color(0xFFF5F4F8),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Center(
              child: Text(
                'skip',
                style: TextStyle(
                  color: Color(0xFF3A3F67),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return RichText(
      text: const TextSpan(
        style: TextStyle(fontSize: 25, color: Color(0xFF252B5C)),
        children: [
          TextSpan(
            text: 'Select your preferable\n',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          TextSpan(
            text: 'Real Estate Type',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }

  Widget _buildSubtitle() {
    return const Text(
      'Share Your Location to Continue',
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Color(0xFF53587A),
      ),
    );
  }

  Widget _buildRealEstateTypeGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 164 / 180,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: _realEstateTypes.length,
      itemBuilder: (context, index) {
        return _buildRealEstateTypeItem(index);
      },
    );
  }

  Widget _buildRealEstateTypeItem(int index) {
    bool isSelected = _selectedIndices.contains(index);
    return GestureDetector(
      onTap: () => setState(() {
        if (isSelected) {
          _selectedIndices.remove(index);
        } else {
          _selectedIndices.add(index);
        }
      }),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? const Color(0xFF1F4C6B) : Colors.transparent,
            width: 2,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                _realEstateTypes[index]['image'],
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: isSelected ? const Color(0xFF1F4C6B) : const Color(0xFFF5F4F8),
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: Text(
                    _realEstateTypes[index]['name'],
                    style: TextStyle(
                      color: isSelected ? Colors.white : const Color(0xFF252B5C),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFF2E429E) : const Color(0xFFFFFFFFE5),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check,
                    size: 16,
                    color: isSelected ? Colors.white : const Color(0xFF234F68),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        children: [



          GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Container(
                    height: 63,
                    width: 230,
                    decoration: BoxDecoration(
                      color: const Color(0xff2E429E),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Center(
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

        ],
      ),
    );
  }
}