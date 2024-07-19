import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pinterest_clone/models/allAlbum.model.dart';
import 'package:pinterest_clone/screen/widgets/homeWidgets/home_photo_item.dart';

import '../../../services/allAlbum_service.dart';

List<AllPhotoModel> photoList1 = [];
Widget page1() {
  return SafeArea(
    child: Container(
        child: photoList1.isEmpty
            ? FutureBuilder(
                future: AllAlbumService.getCarAlbum(1),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    EasyLoading.show();
                    return const SizedBox();
                  } else if (snapshot.hasData) {
                    snapshot.data?.fold((l) {
                      EasyLoading.showError(l);
                    }, (r) {
                      EasyLoading.dismiss();
                      photoList1 = r;
                    });
                    return Padding(
                      padding: const EdgeInsets.all(5),
                      child: MasonryGridView.builder(
                          shrinkWrap: true,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemCount: photoList1.length,
                          physics: const ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return homeItem1(photoList1[index], context);
                          }),
                    );
                  } else {
                    return Text("Error: ${snapshot.error}");
                  }
                },
              )
            : Padding(
                padding: const EdgeInsets.all(5),
                child: MasonryGridView.builder(
                    shrinkWrap: true,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: photoList1.length,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return homeItem1(photoList1[index], context);
                    }),
              )),
  );
}
