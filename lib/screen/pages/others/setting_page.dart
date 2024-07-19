import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pinterest_clone/screen/pages/others/developer_page.dart';
import 'package:pinterest_clone/widgets/language_bottom_sheet.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 25, 25, 26),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 25, 25, 26),
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          _buildListTileWithDivider(
            leading: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            title: const Text(
              'Term',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            onTap: () {},
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ),
          _buildListTileWithDivider(
            leading: const Icon(
              Icons.lock,
              color: Colors.white,
            ),
            title: const Text(
              'Privacy',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            onTap: () {},
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ),
          _buildListTileWithDivider(
            leading: const Icon(
              Icons.language,
              color: Colors.white,
            ),
            title: Text(
              tr('enum.language'),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            onTap: () {
              LanuagesBottomSheet().show(context);
            },
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ),
          _buildListTileWithDivider(
            leading: const Icon(
              Icons.info,
              color: Colors.white,
            ),
            title: const Text(
              'Developer',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const DeveloperPage(),
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTileWithDivider({
    required Widget leading,
    required Widget title,
    required Function() onTap,
    Widget? trailing,
  }) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          onTap: onTap,
          leading: leading,
          title: title,
          trailing: trailing,
        ),
        Divider(
          height: 1, // Adjust the height as needed
          thickness: 1, // Adjust the thickness as needed

          color: Colors.grey.shade200, // Customize the divider color
        ),
      ],
    );
  }
}
