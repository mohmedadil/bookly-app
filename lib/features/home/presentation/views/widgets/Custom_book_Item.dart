import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';

class Custom_Book_Item extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.red,
            image: const DecorationImage(
                image: AssetImage(AssetsData.test), fit: BoxFit.fill)),
      ),
    );
  }
}
