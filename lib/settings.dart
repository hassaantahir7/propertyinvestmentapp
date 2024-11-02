import 'package:flutter/material.dart';
import 'package:property_investment_app/language_settings.dart';
import 'package:property_investment_app/lang,terms.dart';
import 'package:property_investment_app/notifi_settings.dart';
import 'package:property_investment_app/start_investment.dart';

class SettingsUI extends StatelessWidget {
  const SettingsUI({Key? key}) : super(key: key);

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
            'User Settings',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xff0D0B0C),
            ),
          ),
        ),



      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(height: 24),
                _buildSectionHeader('Account'),
                const SizedBox(height: 16),
                GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfile() ));
                    },
                    child: _buildSettingItem(Icons.person_outline, 'Edit profile')),
                _buildSettingItem(Icons.security, 'Security'),
                GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationSettingsScreen()));
                    },
                    child: _buildSettingItem(Icons.notifications_none, 'Notifications')),
                GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LanguageSelectionScreen()));
                    },
                    child: _buildSettingItem(Icons.language, 'Language')),
                _buildSettingItem(Icons.credit_card, 'My Subscription'),
                const SizedBox(height: 24),
                _buildSectionHeader('Support & About'),
                const SizedBox(height: 16),
                _buildSettingItem(Icons.help_outline, 'Help & Support'),
                GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPolicy()));
                    },
                    child: _buildSettingItem(Icons.description_outlined, 'Terms and Policies')),
                const SizedBox(height: 24),
                _buildSectionHeader('Actions'),
                const SizedBox(height: 16),
                _buildSettingItem(Icons.report_problem_outlined, 'Report a problem'),
            _buildSettingItem(Icons.logout, 'Log out'),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Color(0xFF000000),
      ),
    );
  }

  Widget _buildSettingItem(IconData icon, String title) {
    return Container(
      height: 53,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFF2E429E), size: 24),
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(
                color: Color(0xFF6A7380),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Section with Back Icon and 'Edit Profile' text
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: const Color(0xFFE8E6F9),
                              width: 1,
                            ),
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Color(0xFF343333),
                            size: 20,
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Center(
                          child: Text(
                            'Edit Profile',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF0D0B0C),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 40), // Balance for back button
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Profile Image with Camera Icon
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 4,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff242760),
                              blurRadius: 0.5,
                              spreadRadius: 0.5,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(75),
                          child: Image.asset(
                            'assets/editprofile.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 1,
                        bottom: 5,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            color: Color(0xFF242760),
                            size: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // Form Fields
                _buildFormField('Name', 'Melissa Peters'),
                _buildFormField('Email', 'melpeters@gmail.com'),
                _buildFormField(
                  'Date of Birth',
                  '23/05/1995',
                  suffix: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Color(0xFF6A7380),
                  ),
                ),
                _buildFormField(
                  'Country/Region',
                  'Nigeria',
                  suffix: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Color(0xff6A7380),
                  ),
                ),
                const SizedBox(height: 32),

                // Save Changes Button
                Center(
                  child: Container(
                    width: 180,
                    height: 52,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF2E429E), Color(0xFF3454D1)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(26),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF2E429E).withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26),
                        ),
                      ),
                      child: const Text(
                        'Save Changes',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormField(String label, String initialValue, {Widget? suffix}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xff6A7380),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: const Color(0xFFE8E6F9),
              width: 1,
            ),
          ),
          child: TextFormField(
            initialValue: initialValue,
            style: const TextStyle(
              color: Color(0xffA2A7AF),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 16,
              ),
              border: InputBorder.none,
              suffixIcon: suffix,
              suffixIconConstraints: const BoxConstraints(
                minWidth: 48,
                minHeight: 48,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}