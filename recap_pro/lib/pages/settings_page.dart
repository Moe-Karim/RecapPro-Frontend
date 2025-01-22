import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recap_pro/controllers/user_controller.dart';
import 'package:recap_pro/services/auth_service.dart';
import 'package:recap_pro/services/theme_provider.dart';
import 'package:recap_pro/utils/design.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  AuthService authService = AuthService();
  UserController user = UserController();

  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();

  void updatePassword() {
    user.changePassword(
        _oldPasswordController.text, _newPasswordController.text, context);
  }

  void deleteAccount() {
    user.deleteUser(context);
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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: ListView(
          children: [
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: Icon(Icons.lock),
                    title: Text(
                      'Change Password',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Update your password'),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        scrollPadding: EdgeInsets.all(10),
                        controller: _oldPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(labelText: 'Old Password'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: _newPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(labelText: 'New Password'),
                      ),
                    ),
                  ),
                  ListTile(
                    leading:
                        Icon(Icons.password_outlined, color: Color(0xFF61DBFB)),
                    title: Text(
                      'Change Password',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onTap: updatePassword,
                  ),
                ],
              ),
            ),
            Divider(),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: ListTile(
                leading: Icon(
                  Icons.brightness_6,
                  color: Color(0xFF61DBFB),
                ),
                title: Text(
                  "Enable Dark Mode",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Switch(
                  activeColor: Color(0xFF61DBFB),
                  value: Provider.of<ThemeProvider>(context).isDarkMode,
                  onChanged: (bool value) {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toggleTheme();
                  },
                ),
              ),
            ),
            Divider(),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: ListTile(
                leading: Icon(Icons.delete, color: Colors.red),
                title: Text(
                  'Delete Account',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Remove your account permanently'),
                onTap: deleteAccount,
              ),
            ),
            Divider(),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: ListTile(
                leading: Icon(Icons.delete_forever, color: Colors.red),
                title: Text(
                  'Clear Videos',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Remove all videos from your account'),
                onTap: clearVideos,
              ),
            ),
            Divider(),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: ListTile(
                leading: Icon(Icons.exit_to_app, color: Colors.red),
                title: Text(
                  'Log Out',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Sign out of your account'),
                onTap: logOut,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
