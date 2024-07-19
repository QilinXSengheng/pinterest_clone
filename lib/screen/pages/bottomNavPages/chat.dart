import 'package:flutter/material.dart';
import 'package:pinterest_clone/screen/pages/bottomNavPages/messages_tab.dart';
import 'package:pinterest_clone/screen/pages/bottomNavPages/updates_tab.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const SizedBox(
            width: 200,
            child: TabBar(
              indicatorWeight: 4,
              tabs: [
                Tab(
                  text: 'Updates',
                ),
                Tab(
                  text: 'Messages',
                ),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            Chat1(),
            Chat2(),
          ],
        ),
      ),
    );
  }
}
