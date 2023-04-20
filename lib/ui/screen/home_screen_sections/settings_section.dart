import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../widgets/change_password.dart';
import '../../widgets/custom_alert_dialog.dart';
import '../../widgets/drawer_button.dart';
import '../login_screen.dart';

class SettingsSection extends StatefulWidget {
  const SettingsSection({super.key});

  @override
  State<SettingsSection> createState() => _SettingsSectionState();
}

class _SettingsSectionState extends State<SettingsSection> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Settings',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
          ),
          const SizedBox(height: 10),
          DrawerButton(
            iconData: Icons.lock_outline,
            label: 'Change Password',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const ChangePasswordDialog(),
              );
            },
            isSelected: false,
          ),
          const SizedBox(
            height: 10,
          ),
          DrawerButton(
            iconData: Icons.logout_outlined,
            label: 'Logout',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => CustomAlertDialog(
                  title: 'Logout',
                  message: 'Are you sure you want to logout?',
                  primaryButtonLabel: 'Logout',
                  primaryOnPressed: () async {
                    await Supabase.instance.client.auth.signOut();
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  secondaryButtonLabel: 'Cancel',
                ),
              );
            },
            isSelected: false,
          ),
        ],
      ),
    );
  }
}
