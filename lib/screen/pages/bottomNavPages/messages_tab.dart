import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

bool isActive = false;

class Chat2 extends StatefulWidget {
  const Chat2({super.key});

  @override
  State<Chat2> createState() => _Chat2State();
}

class _Chat2State extends State<Chat2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 24, 23, 23),
      body: _buildBody(),
    );
  }

  Column _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 15),
          padding: const EdgeInsets.only(left: 5),
          child: Text(
          tr('message'),
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
        const ListTile(
          leading: CircleAvatar(
            backgroundColor: Color.fromARGB(255, 248, 202, 202),
            child: Text(
              "D",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 19,
              ),
            ),
          ),
          trailing: Text('7:54 AM',
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          ),
          title: Text(
            "Dom",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          subtitle: Text(
            "Jak Va",
            style: TextStyle(
              fontSize: 12,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
        const ListTile(
          leading: CircleAvatar(
            backgroundColor: Color.fromARGB(255, 248, 202, 202),
            child: Text(
              "H",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 19,
              ),
            ),
            
          ),
          trailing: Text('4:14 PM',
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          ),
          title: Text(
            "Va Neathh",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          subtitle: Text(
            "Hello",
            style: TextStyle(
              fontSize: 12,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
        const ListTile(
          leading: CircleAvatar(
            backgroundColor: Color.fromARGB(255, 248, 202, 202),
            child: Text(
              "V",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 19,
              ),
            ),
            
          ),
          trailing: Text('9:20 PM',
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          ),
          title: Text(
            "Heng",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          subtitle: Text(
            "Hi",
            style: TextStyle(
              fontSize: 12,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 15),
          padding: const EdgeInsets.only(left: 5),
          child:  Text(
            tr('contacts'),
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
      ),
    );
  }
}
