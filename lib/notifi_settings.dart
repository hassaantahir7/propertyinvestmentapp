import 'package:flutter/material.dart';

class NotificationSettingsScreen extends StatefulWidget {
  @override
  _NotificationSettingsScreenState createState() => _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState extends State<NotificationSettingsScreen> {
  // Track the state of toggles
  List<bool> toggleStates = [
    true, // General Notification
    false, // Sound
    true, // Vibrate
    false, // App updates
    true, // Bill Reminder
    true, // Promotion
    false, // Discount Available
    false, // Payment Request
    false, // New Service Available
    true, // New Tips Available
  ];

  @override
  Widget build(BuildContext context) {
    // Responsive sizing for font and spacing
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.03),

                // Top Bar with Back Button and Title
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        height: screenHeight * 0.051,
                        width: screenHeight * 0.051,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(screenHeight * 0.03),
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
                    Expanded(
                      child: Center(
                        child: Text(
                          'Notifications',
                          style: TextStyle(
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF0D0B0C),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: screenHeight * 0.06), // Balancing the back button width
                  ],
                ),
                SizedBox(height: screenHeight * 0.04),

                // Section 1: Common
                Text(
                  'Common',
                  style: TextStyle(
                    color: Color(0xff000000),
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),

                // Common Settings: General Notification, Sound, Vibrate
                buildToggleRow(screenWidth, screenHeight, 'General Notification', 0),
                buildToggleRow(screenWidth, screenHeight, 'Sound', 1),
                buildToggleRow(screenWidth, screenHeight, 'Vibrate', 2),

                SizedBox(height: screenHeight * 0.04),

                // Section 2: System & services update
                Text(
                  'System & services update',
                  style: TextStyle(
                    color: Color(0xff000000),
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),

                // System & services update Settings
                buildToggleRow(screenWidth, screenHeight, 'App updates', 3),
                buildToggleRow(screenWidth, screenHeight, 'Bill Reminder', 4),
                buildToggleRow(screenWidth, screenHeight, 'Promotion', 5),
                buildToggleRow(screenWidth, screenHeight, 'Discount Available', 6),
                buildToggleRow(screenWidth, screenHeight, 'Payment Request', 7),

                SizedBox(height: screenHeight * 0.04),

                // Section 3: Others
                Text(
                  'Others',
                  style: TextStyle(
                    color: Color(0xff000000),
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),

                // Other Settings
                buildToggleRow(screenWidth, screenHeight, 'New Service Available', 8),
                buildToggleRow(screenWidth, screenHeight, 'New Tips Available', 9),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // A function to create each row with the label and the toggle switch
  Widget buildToggleRow(double screenWidth, double screenHeight, String label, int index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Color(0xff6A7380),
              fontSize: screenWidth * 0.04,
              fontWeight: FontWeight.w400,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                toggleStates[index] = !toggleStates[index]; // Toggle the state
              });
            },
            child: Container(
              width: screenWidth * 0.13,
              height: screenHeight * 0.03,
              decoration: BoxDecoration(
                color: toggleStates[index] ? Color(0xff2E429E) : Color(0xffD9D9D9),
                borderRadius: BorderRadius.circular(screenHeight * 0.015),
              ),
              child: Row(
                mainAxisAlignment: toggleStates[index] ? MainAxisAlignment.end : MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(screenWidth * 0.01),
                    child: Container(
                      width: screenWidth * 0.045,
                      height: screenWidth * 0.045,
                      decoration: BoxDecoration(
                        color: Color(0xffFFFFFF),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LanguagesSettings extends StatefulWidget {
  const LanguagesSettings({super.key});

  @override
  State<LanguagesSettings> createState() => _LanguagesSettingsState();
}

class _LanguagesSettingsState extends State<LanguagesSettings> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class LanguageSettings extends StatefulWidget {
  const LanguageSettings({super.key});

  @override
  State<LanguageSettings> createState() => _LanguageSettingsState();
}

class _LanguageSettingsState extends State<LanguageSettings> {
  String selectedLanguage = 'English (UK)';

  final List<String> languages = [
    'English (UK)',
    'Mandarin',
    'Hindi',
    'Spanish',
    'French',
    'Arabic',
    'Russian',
    'Indonesia',
    'Vietnamese',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // Add MaterialApp wrapper
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize( // Replace the custom header with AppBar
          preferredSize: const Size.fromHeight(60),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                        'Language',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0D0B0C),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                ],
              ),
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Text(
                'Suggested',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF000000),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  final language = languages[index];
                  final isSelected = language == selectedLanguage;

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          language,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF000000),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedLanguage = language;
                            });
                          },
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isSelected ? const Color(0xff2E429E) : const Color(0xffEDF4FF),
                              border: Border.all(
                                color: const Color(0xFFECECEC),
                                width: 2,
                              ),
                            ),
                            child: isSelected
                                ? const Center(
                              child: Icon(
                                Icons.check,
                                size: 16,
                                color: Colors.white,
                              ),
                            )
                                : null,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
