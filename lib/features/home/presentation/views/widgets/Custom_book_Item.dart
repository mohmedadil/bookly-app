import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';

class Custom_Book_Item extends StatelessWidget {
  final String imageUrl;

  const Custom_Book_Item({super.key, required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.red,
            image: DecorationImage(
                image: NetworkImage(imageUrl), fit: BoxFit.fill)),
      ),
    );
  }
}
