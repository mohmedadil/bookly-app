import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Custom_Appbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 20),
      child: Row(
        children: [
          Image.asset(
            AssetsData.logo,
            height: 18,
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              GoRouter.of(context).push('/search');
            },
            icon: Icon(
              Icons.search,
              size: 24,
            ),
          )
        ],
      ),
    );
  }
}
