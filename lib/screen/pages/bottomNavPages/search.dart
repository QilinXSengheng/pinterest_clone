import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pinterest_clone/screen/widgets/chatWidgets.dart/collection_item.dart';
import 'package:pinterest_clone/storage/storage.dart';

import '../../../models/SearchModel.dart';
import '../../../services/photo_service.dart';
import '../../widgets/homeWidgets/home_photo_item.dart';

List<Result> searchList = [];

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController search = TextEditingController();

  int _currentPage = 1;
  bool showHistory = false;

  List<Map<String, dynamic>> ideasForYou = [
    {
      'title': 'Loki Marvels',
      'image': 'assets/loki.jpg',
    },
    {
      'title': 'One Piece',
      'image': 'assets/one-piece.jpg',
    },
  ];

  List<Map<String, dynamic>> popularOnPinterest = [
    {
      'title': 'Animal',
      'image': 'assets/animal.jpg',
    },
    {
      'title': 'Wallpapers',
      'image': 'assets/wallpaper.jpg',
    },
    {
      'title': 'Fruits',
      'image': 'assets/fruits.jpg',
    },
    {
      'title': 'Celebrities',
      'image': 'assets/celebrity.jpg',
    },
    {
      'title': 'Dogs',
      'image': 'assets/dogs.jpg',
    },
    {
      'title': 'Cartoons',
      'image': 'assets/cartoon.jpg',
    },
  ];

  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    searchList.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 50,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextFormField(
                onTap: () {
                  showHistory = true;
                  setState(() {});
                },
                onChanged: (value) async {
                  if (value.isEmpty) {
                    searchList.clear();
                    setState(() {});
                  }
                  if (value.length > 2) {
                    searchList.clear();
                    var res = await PhotoService.searchPhotos(search: value, page: _currentPage);
                    res.fold((l) {
                      EasyLoading.showError(l);
                    }, (r) {
                      searchedPhotos!.add(value);
                      for (int i = 0; i < searchedPhotos!.values.length - 1; i++) {
                        searchedPhotos!.deleteAt(i);
                      }
                      showHistory = false;
                      searchList = r;
                      setState(() {});
                    });
                  }
                },
                controller: search,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlignVertical: TextAlignVertical.bottom,
                cursorColor: Colors.red,
                cursorHeight: 25,
                decoration: InputDecoration(
                    hintText: tr('search_hint'),
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(
                      Icons.search,
                    ),
                    suffixIcon: const Icon(
                      Icons.camera_alt,
                    ),
                    filled: true,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      borderSide: BorderSide.none,
                    )),
              ),
            ),
          )),
      body: showHistory == true
          ? ListView.builder(
              itemCount: searchedPhotos!.values.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Text(
                            searchedPhotos!.getAt(index)!,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            searchedPhotos!.deleteAt(index);

                            setState(() {});
                          },
                          icon: const Icon(
                            Icons.clear,
                            size: 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      child: searchList.isEmpty
                          ? Column(
                              children: [
                                // * Ideas for you
                                Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(bottom: 20),
                                  child: Text(
                                    tr('ideas_for_you'),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                GridView.builder(
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 4,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: 1.5,
                                  ),
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: ideasForYou.length,
                                  itemBuilder: (context, index) {
                                    return CollectionItem(
                                      imageUrl: ideasForYou[index]['image'],
                                      title: ideasForYou[index]['title'],
                                    );
                                  },
                                ),
                                // * Popular on Pinterest
                                Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                                  child: Text(
                                    tr('popular_on_pinterest'),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                GridView.builder(
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 4,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: 1.5,
                                  ),
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: popularOnPinterest.length,
                                  itemBuilder: (context, index) {
                                    return CollectionItem(
                                      imageUrl: popularOnPinterest[index]['image'],
                                      title: popularOnPinterest[index]['title'],
                                    );
                                  },
                                ),
                              ],
                            )
                          : MasonryGridView.count(
                              shrinkWrap: true,
                              controller: _scrollController,
                              crossAxisCount: 2,
                              mainAxisSpacing: 4,
                              crossAxisSpacing: 4,
                              itemCount: searchList.length,
                              itemBuilder: (context, index) {
                                return searchItem(
                                  searchList[index],
                                  context,
                                );
                              },
                            ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    search.dispose();
  }
}
