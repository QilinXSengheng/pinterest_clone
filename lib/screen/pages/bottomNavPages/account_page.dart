import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pinterest_clone/models/userInfo_model.dart';
import 'package:pinterest_clone/screen/pages/bottomNavPages/profile.dart';
import 'package:pinterest_clone/screen/pages/others/appearance_page.dart';
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
      appBar: AppBar(
        title: Text(tr('your_account')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
            const SizedBox(height: 100),
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
          child: Text(
            tr('settings'),
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        const SizedBox(height: 10),
        _buildAccountTile(
          title: tr('account_management'),
          onTap: () {},
        ),
        _buildAccountTile(
            title: tr('language'),
            onTap: () {
              LanuagesBottomSheet().show(context);
            }),
        _buildAccountTile(
          title: tr('appearance'),
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AppearanceView(),
            ),
          ),
        ),
        _buildAccountTile(
          title: tr('profile_visibility'),
          onTap: () {},
        ),
        _buildAccountTile(
          title: tr('home_feed_tuner'),
          onTap: () {},
        ),
        _buildAccountTile(
          title: tr('claimed_accounts'),
          onTap: () {},
        ),
        _buildAccountTile(
          title: tr('notifications'),
          onTap: () {},
        ),
        _buildAccountTile(
          title: tr('privacy_and_data'),
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
          title: tr('add_account'),
          onTap: () {},
        ),
        _buildAccountTile(
          title: tr('security'),
          onTap: () {},
        ),
        _buildAccountTile(
          title: tr('login'),
          onTap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const LoginPage())),
        ),
      ],
    );
  }

  Widget _buildSupportSection() {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            tr('support'),
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        const SizedBox(height: 10),
        _buildAccountTile(
          title: tr('help_center'),
          onTap: () {},
        ),
        _buildAccountTile(
          title: tr('developers'),
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const DeveloperPage()),
          ),
        ),
        _buildAccountTile(
          title: tr('terms_of_service'),
          onTap: () {},
        ),
        _buildAccountTile(
          title: tr('privacy_policy'),
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
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      title: Text(username),
      subtitle: Text(tr('view_profile')),
      onTap: onTap,
      trailing: const Icon(
        Icons.arrow_forward_ios,
      ),
    );
  }

  Widget _buildAccountTile({required String title, required Function() onTap}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      trailing: const Icon(Icons.arrow_forward_ios),
      title: Text(title),
      onTap: onTap,
    );
  }
}
