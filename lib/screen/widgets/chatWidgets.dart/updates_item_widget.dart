import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pinterest_clone/models/allAlbum.model.dart';

class UpdatesItemWidget extends StatelessWidget {
  final AllPhotoModel model;
  const UpdatesItemWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: CachedNetworkImage(
            imageUrl: model.urls!.small!,
            width: 40,
            height: 40,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        title: Text(
          model.altDescription ?? 'No description',
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          'posted at ${model.createdAt}',
          style: const TextStyle(
            fontSize: 14,
          ),
        ));
  }
}
