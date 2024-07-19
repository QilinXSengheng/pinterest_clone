import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pinterest_clone/models/userInfo_model.dart';
import 'package:pinterest_clone/screen/pages/bottomNavPages/profile.dart';
import 'package:pinterest_clone/screen/pages/others/developer_page.dart';
import 'package:pinterest_clone/screen/pages/others/login_page.dart';
import 'package:pinterest_clone/services/userInfo_service.dart';
import 'package:pinterest_clone/widgets/language_bottom_sheet.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  List<UserInfoModel> info = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 25, 25, 26),
      appBar: AppBar(
        title: const Text('Your account'),
        backgroundColor: const Color.fromARGB(255, 25, 25, 26),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // * Profile
            FutureBuilder(
                future: UserInfoService.getPhotos(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    EasyLoading.show();
                    return const SizedBox();
                  } else if (snapshot.hasData) {
                    snapshot.data?.fold((l) {
                      EasyLoading.showError(l);
                    }, (r) {
                      EasyLoading.dismiss();
                      //UserInfoModel infoModel = r;
                      info.add(r);
                    });
                    return _buildProfileListTile(
                      profileLetter: info[0].name[0],
                      username: info[0].username,
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const ProfilePage()),
                      ),
                    ); // Add a return statement here
                  } else {
                    return const SizedBox();
                  }
                }),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  _buildSettingSection(),
                  const SizedBox(height: 20),
                  _buildLoginSection(),
                  const SizedBox(height: 20),
                  _buildSupportSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingSection() {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: const Text(
            'Settings',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        const SizedBox(height: 10),
        _buildAccountTile(
          title: 'Account Management',
          onTap: () {},
        ),
        _buildAccountTile(
            title: 'Language',
            onTap: () {
              LanuagesBottomSheet().show(context);
            }),
        _buildAccountTile(
          title: 'Profile visibility',
          onTap: () {},
        ),
        _buildAccountTile(
          title: 'Home feed turner',
          onTap: () {},
        ),
        _buildAccountTile(
          title: 'Claimed accounts',
          onTap: () {},
        ),
        _buildAccountTile(
          title: 'Notifications',
          onTap: () {},
        ),
        _buildAccountTile(
          title: 'Privacy and Data',
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildLoginSection() {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: const Text(
            'Login',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        const SizedBox(height: 10),
        _buildAccountTile(
          title: 'Add account',
          onTap: () {},
        ),
        _buildAccountTile(
          title: 'Security',
          onTap: () {},
        ),
        _buildAccountTile(
          title: 'Log in',
          onTap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => LoginPage())),
        ),
      ],
    );
  }

  Widget _buildSupportSection() {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: const Text(
            'Support',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        const SizedBox(height: 10),
        _buildAccountTile(
          title: 'Help Center',
          onTap: () {},
        ),
        _buildAccountTile(
          title: 'Developers',
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const DeveloperPage()),
          ),
        ),
        _buildAccountTile(
          title: 'Terms of service',
          onTap: () {},
        ),
        _buildAccountTile(
          title: 'Privacy policy',
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildProfileListTile(
      {required String profileLetter,
      required String username,
      required Function() onTap}) {
    return ListTile(
      visualDensity: const VisualDensity(vertical: -4),
      leading: CircleAvatar(
        backgroundColor: Colors.grey,
        child: Center(
          child: Text(
            profileLetter,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      title: Text(username, style: const TextStyle(color: Colors.white)),
      subtitle:
          const Text('View profile', style: TextStyle(color: Colors.white)),
      onTap: onTap,
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.white,
      ),
    );
  }

  Widget _buildAccountTile({required String title, required Function() onTap}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      trailing: const Icon(Icons.arrow_forward_ios),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      onTap: onTap,
    );
  }
}
