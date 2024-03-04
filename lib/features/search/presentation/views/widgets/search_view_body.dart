import 'package:bookly/core/utils/style.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:bookly/features/search/presentation/views/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class SeachViewBody extends StatelessWidget {
  const SeachViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(),
          SizedBox(
            height: 16,
          ),
          Text(
            'Search Result',
            style: Styles.textStyle20,
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(child: SearchListView()),
        ],
      ),
    );
  }
}

class SearchListView extends StatelessWidget {
  const SearchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) => const Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        // child: BookListViewItem(),
        child: Text('test'),
      ),
      itemCount: 12,
    );
    
  }
}
