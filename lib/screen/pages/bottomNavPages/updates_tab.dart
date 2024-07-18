import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pinterest_clone/screen/pages/others/all_tab.dart';
import 'package:pinterest_clone/screen/widgets/chatWidgets.dart/updates_item_widget.dart';
import 'package:pinterest_clone/screen/widgets/homeWidgets/homePhoto_item.dart';
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
      backgroundColor: Color.fromARGB(255, 24, 23, 23),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 5),
              child: Text(
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
                  return SizedBox();
                } else if (snapshot.hasData) {
                  snapshot.data?.fold((l) {
                    EasyLoading.showError(l);
                  }, (r) {
                    EasyLoading.dismiss();
                    photoList3 = r;
                  });
                  return Padding(
                    padding: EdgeInsets.all(5),
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
