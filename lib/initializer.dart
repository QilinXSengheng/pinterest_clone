import 'package:hive_flutter/adapters.dart';
import 'package:pinterest_clone/core/constants.dart';
import 'package:pinterest_clone/models/allAlbum.model.dart';
import 'package:pinterest_clone/storage/storage.dart';

class Initializer {
  static Future<void> load() async {
    await Hive.initFlutter();

    Hive.registerAdapter(AllPhotoModelAdapter());
    Hive.registerAdapter(AllPhotoModelLinksAdapter());
    Hive.registerAdapter(TopicSubmissionsAdapter());
    Hive.registerAdapter(ArtsCultureAdapter());
    Hive.registerAdapter(FilmAdapter());
    Hive.registerAdapter(UrlsAdapter());
    Hive.registerAdapter(UserAdapter());
    Hive.registerAdapter(UserLinksAdapter());
    Hive.registerAdapter(ProfileImageAdapter());
    Hive.registerAdapter(SocialAdapter());

    box = await Hive.openBox('box');
    searchedPhotos = await Hive.openBox('searchedPhotos');
    AppInit.configLoading();
  }
}
