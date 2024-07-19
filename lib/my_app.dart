import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pinterest_clone/main.dart';
import 'package:pinterest_clone/screen/pages/bottomNavPages/account_page.dart';
import 'package:pinterest_clone/screen/pages/bottomNavPages/add.dart';
import 'package:pinterest_clone/screen/pages/bottomNavPages/chat.dart';
import 'package:pinterest_clone/screen/pages/bottomNavPages/home.dart';
import 'package:pinterest_clone/screen/pages/bottomNavPages/search.dart';
import 'package:pinterest_clone/screen/widgets/bottomNavWidgets/bottomNavItem.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      home: const Page(),
    );
  }
}

class Page extends StatefulWidget {
  const Page({super.key});

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.only(bottom: 20),
          height: 70,
          decoration: BoxDecoration(color: const Color.fromARGB(255, 31, 40, 48), borderRadius: BorderRadius.circular(20)),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: bottomNavItem(
                    index,
                    list[index],
                    () {
                      index != 2 ? _controller.jumpToPage(index) : null;
                      setState(
                        () {},
                      );
                    },
                    context,
                  ),
                );
              },
            ),
          ),
        ),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (value) {
          b = value;
          page = b;
          // _controller.jumpToPage(page);
          setState(() {});
        },
        controller: _controller,
        children: const [
          HomePage(),
          SearchPage(),
          AddPage(),
          ChatPage(),
          AccountPage(),
        ],
      ),
    );
  }
}
