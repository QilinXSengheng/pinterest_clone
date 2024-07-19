import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pinterest_clone/screen/pages/others/all_tab.dart';
import 'package:pinterest_clone/screen/widgets/chatWidgets.dart/updates_item_widget.dart';
import 'package:pinterest_clone/services/lifestyle_service.dart';

class Chat1 extends StatefulWidget {
  const Chat1({super.key});

  @override
  State<Chat1> createState() => _Chat1State();
}

class _Chat1State extends State<Chat1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 24, 23, 23),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 5),
              child: const Text(
                'What you might see',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            FutureBuilder(
              future: LifeAlbumService.getLifeAlbum(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  EasyLoading.show();
                  return const SizedBox();
                } else if (snapshot.hasData) {
                  snapshot.data?.fold((l) {
                    EasyLoading.showError(l);
                  }, (r) {
                    EasyLoading.dismiss();
                    photoList3 = r;
                  });
                  return Padding(
                    padding: const EdgeInsets.all(5),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: photoList3.length,
                        physics: const ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return UpdatesItemWidget(
                            model: photoList3[index],
                          );
                        }),
                  );
                } else {
                  return Text("Error: ${snapshot.error}");
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
