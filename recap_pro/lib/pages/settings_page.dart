import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recap_pro/main.dart';
import 'package:recap_pro/services/theme_provider.dart';
import 'package:recap_pro/utils/design.dart';
import 'package:recap_pro/widgets/custom_card.dart';
import 'package:recap_pro/services/auth_service.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  AuthService authService = AuthService();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();

  void updateName() {
    print("Name updated: ${_nameController.text}");
  }

  void updatePassword() {
    print("Password updated");
  }

  void deleteAccount() {
    print("Account deleted");
  }

  void clearVideos() {
    print("Videos cleared");
  }

  void logOut() {
    authService.logOut(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: ListView(children: [
            CustomCard(
              title: 'Change Name',
              subtitle: Text('Update your name'),
              icon: Icons.edit,
              onTap: updateName,
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'New Name'),
              ),
            ),
            Divider(),
            CustomCard(
              title: 'Change Password',
              subtitle: Text('Update your password'),
              icon: Icons.lock,
              onTap: updatePassword,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _oldPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(labelText: 'Old Password'),
                  ),
                  TextField(
                    controller: _newPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(labelText: 'New Password'),
                  ),
                  ElevatedButton(
                    onPressed: updatePassword,
                    child: Text("Update Password"),
                  ),
                ],
              ),
            ),
            Divider(),
            CustomCard(
              title: 'Dark Mode',
              subtitle: Text('Toggle dark mode on/off'),
              icon: Icons.brightness_6,
              child: SwitchListTile(
                title: Text("Enable Dark Mode"),
                value: Provider.of<ThemeProvider>(context).isDarkMode,
                onChanged: (bool value) {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme();
                },
              ),
              onTap: () {},
            ),
            Divider(),
            CustomCard(
                title: 'Delete Account',
                subtitle: Text('Remove your account permanently'),
                icon: Icons.delete,
                onTap: () {},
                child: GestureDetector(
                  onTap: deleteAccount,
                  child: const Text(
                    "Delete Account",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                )),
            Divider(),
            CustomCard(
                title: 'Clear Videos',
                subtitle: Text('Remove all videos from your account'),
                icon: Icons.delete_forever,
                onTap: () {},
                child: GestureDetector(
                  onTap: deleteAccount,
                  child: const Text(
                    "Clear Videos",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                )),
            Divider(),
            CustomCard(
                title: 'Log Out',
                subtitle: Text('Sign out of your account'),
                icon: Icons.exit_to_app,
                onTap: (logOut) ,
                child: GestureDetector(
                  child: const Text(
                    "Log Out",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                )),
          ]),
        ));
  }
}
