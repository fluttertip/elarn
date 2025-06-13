import 'package:flutter/material.dart';
import 'package:elearningapp/utils/colors.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: AppColors.primary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            leading: const Icon(Icons.person, color: AppColors.primary),
            title: const Text('Account'),
            subtitle: const Text('Manage your account'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.notifications, color: AppColors.primary),
            title: const Text('Notifications'),
            subtitle: const Text('Notification preferences'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          const Divider(),
          // ListTile(
          //   leading: const Icon(Icons.palette, color: AppColors.primary),
          //   title: const Text('Theme'),
          //   subtitle: const Text('Light / Dark mode'),
          //   trailing: Switch(value: false, onChanged: (val) {}),
          // ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Logout'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
