import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Custom_Book_Item extends StatelessWidget {
  final String imageUrl;

  const Custom_Book_Item({super.key, required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
          aspectRatio: 2.6 / 4,
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.fill,
            errorWidget: (context, url, error) => const Icon(Icons.error),
          )),
    );
  }
}
