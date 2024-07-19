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
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.65,
                child: const Center(
                  child: Text(
                    'Share ideas width your friends',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width * 0.85,
                child: TextFormField(
                  textAlignVertical: TextAlignVertical.bottom,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: const InputDecoration(
                      hintText: 'Search by name or email address',
                      prefixIcon: Icon(
                        Icons.search,
                      ),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        borderSide: BorderSide.none,
                      )),
                ),
              ),
              const SizedBox(height: 30),
              const ListTile(
                leading: CircleAvatar(
                  child: Text(
                    "D",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 19,
                    ),
                  ),
                ),
                trailing: Text(
                  '7:54 AM',
                ),
                title: Text(
                  "Dom",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Jak Va",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              const ListTile(
                leading: CircleAvatar(
                  child: Text(
                    "H",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 19,
                    ),
                  ),
                ),
                trailing: Text(
                  '4:14 PM',
                ),
                title: Text(
                  "Va Neathh",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Hello",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              const ListTile(
                leading: CircleAvatar(
                  child: Text(
                    "V",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 19,
                    ),
                  ),
                ),
                trailing: Text(
                  '9:20 PM',
                ),
                title: Text(
                  "Heng",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Hi",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
