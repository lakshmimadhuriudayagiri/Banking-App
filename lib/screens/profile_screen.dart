import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _navigateToManageScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ManageScreen()),
    );
  }

  void _navigateToPreferencesScreen(BuildContext context, String preference) {
    if (preference == 'Languages') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LanguageSelectionScreen()),
      );
    } else if (preference == 'Bill notifications') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BillNotificationsScreen()),
      );
    } else if (preference == 'Permissions') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PermissionsScreen()),
      );
    } else if (preference == 'Theme') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ThemeSelectionScreen()),
      );
    } else if (preference == 'Reminders') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RemindersScreen()),
      );
    }
  }

  void _navigateToSecurityScreen(BuildContext context, String securityOption) {
    if (securityOption == 'Biometric & screen lock') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BiometricScreen()),
      );
    } else if (securityOption == 'Set Up passcode') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PasscodeSetupScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(''),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://via.placeholder.com/50'), // Replace with actual image URL
                        radius: 25,
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('**** **** 3997', style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('+91 9701563997', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () => _navigateToManageScreen(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    child: const Text('Manage'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.qr_code),
                  title: const Text('QR codes & UPI IDs'),
                  onTap: () {},
                ),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.payment),
                  title: const Text('Manage payments'),
                  onTap: () {},
                ),
              ),
              const SizedBox(height: 20),
              const Text('PREFERENCES', style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 10),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.language),
                  title: const Text('Languages'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => _navigateToPreferencesScreen(context, 'Languages'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.notifications),
                  title: const Text('Bill notifications'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => _navigateToPreferencesScreen(context, 'Bill notifications'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.lock),
                  title: const Text('Permissions'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => _navigateToPreferencesScreen(context, 'Permissions'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.brightness_6),
                  title: const Text('Theme'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => _navigateToPreferencesScreen(context, 'Theme'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.alarm),
                  title: const Text('Reminders'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => _navigateToPreferencesScreen(context, 'Reminders'),
                ),
              ),
              const SizedBox(height: 20),
              const Text('SECURITY', style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 10),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.fingerprint),
                  title: const Text('Biometric & screen lock'),
                  trailing: Transform.scale(
                    scale: 0.7,
                    child: Switch(
                      value: true,
                      onChanged: (value) {},
                      activeColor: Colors.green,
                    ),
                  ),
                  onTap: () => _navigateToSecurityScreen(context, 'Biometric & screen lock'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.vpn_key),
                  title: const Text('Set Up passcode'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => _navigateToSecurityScreen(context, 'Set Up passcode'),
                ),
              ),
              // Additional options can be added here (e.g., Blocked Accounts, About the App, Logout)
            ],
          ),
        ),
      ),
    );
  }
}

// Manage Screen
class ManageScreen extends StatelessWidget {
  const ManageScreen({super.key});

  void _navigateToDetailsScreen(BuildContext context, String section) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailsScreen(section: section)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://via.placeholder.com/50'), // Replace with actual image URL
                    radius: 25,
                  ),
                  title: const Text('Personal Details'),
                  subtitle: const Text('**** **** 3997\n+91 9701563997'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.edit),
                      Icon(Icons.camera_alt),
                    ],
                  ),
                  onTap: () => _navigateToDetailsScreen(context, 'Personal Details'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.account_balance_wallet),
                  title: const Text('Financial Details'),
                  subtitle: const Text('Income, employment details and more'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => _navigateToDetailsScreen(context, 'Financial Details'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.person_outline),
                  title: const Text('Additional Details'),
                  subtitle: const Text('Age, gender and more'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => _navigateToDetailsScreen(context, 'Additional Details'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.location_on),
                  title: const Text('Saved Addresses'),
                  trailing: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    ),
                    child: const Text('+ ADD NEW'),
                  ),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Details Screen
class DetailsScreen extends StatelessWidget {
  final String section;

  const DetailsScreen({super.key, required this.section});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(section),
      ),
      body: Center(
        child: Text('Details for $section'),
      ),
    );
  }
}

// Language Selection Screen
class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() => _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String? selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Languages'),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text('English'),
            leading: Radio<String>(
              value: 'English',
              groupValue: selectedLanguage,
              onChanged: (value) {
                setState(() {
                  selectedLanguage = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Hindi'),
            leading: Radio<String>(
              value: 'Hindi',
              groupValue: selectedLanguage,
              onChanged: (value) {
                setState(() {
                  selectedLanguage = value;
                });
              },
            ),
          ),
          ElevatedButton(
            onPressed: selectedLanguage != null
                ? () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Language set to $selectedLanguage')),
                    );
                    Navigator.pop(context);
                  }
                : null,
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }
}

// Bill Notifications Screen
class BillNotificationsScreen extends StatelessWidget {
  const BillNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bill Notifications'),
      ),
      body: Center(
        child: const Text('Manage bill notification settings here.'),
      ),
    );
  }
}

// Permissions Screen
class PermissionsScreen extends StatelessWidget {
  const PermissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Permissions'),
      ),
      body: Center(
        child: const Text('Manage app permissions here.'),
      ),
    );
  }
}

// Theme Selection Screen
class ThemeSelectionScreen extends StatelessWidget {
  const ThemeSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme'),
      ),
      body: Center(
        child: const Text('Select theme (Light/Dark) here.'),
      ),
    );
  }
}

// Reminders Screen
class RemindersScreen extends StatelessWidget {
  const RemindersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reminders'),
      ),
      body: Center(
        child: const Text('Set up reminders here.'),
      ),
    );
  }
}

// Biometric Screen
class BiometricScreen extends StatelessWidget {
  const BiometricScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biometric & Screen Lock'),
      ),
      body: Center(
        child: const Text('Enable or disable biometric authentication.'),
      ),
    );
  }
}

// Passcode Setup Screen
class PasscodeSetupScreen extends StatelessWidget {
  const PasscodeSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set Up Passcode'),
      ),
      body: Center(
        child: const Text('Set up your passcode here.'),
      ),
    );
  }
}