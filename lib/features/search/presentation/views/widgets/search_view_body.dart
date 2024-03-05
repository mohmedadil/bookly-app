import 'package:bookly/core/utils/style.dart';
import 'package:bookly/features/home/presentation/views/widgets/Custom_book_Item.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:bookly/features/search/presentation/manager/fetchsearch/fetchsearch_cubit.dart';
import 'package:bookly/features/search/presentation/views/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeachViewBody extends StatelessWidget {
  SeachViewBody({super.key});
  String? search;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(
            onChanged: (value) {
              search = value;
              BlocProvider.of<FetchsearchCubit>(context)
                  .fetchSearchResult(search: value);
            },
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Search Result',
            style: Styles.textStyle20,
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(child: SearchListView()),
        ],
      ),
    );
  }
}

class SearchListView extends StatelessWidget {
  const SearchListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchsearchCubit, FetchsearchState>(
        builder: (context, state) {
      if (state is FetchsearchSuccess) {
        return ListView.builder(
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            // child: BookListViewItem(),
            child:BookListViewItem(book: state.books[index])
          ),
          itemCount: state.books.length,
        );
      } else if (state is FetchsearchLoading) {
        return Center(child: CircularProgressIndicator());
      } else if (state is FetchsearchFailure) {
        return Center(child: Text('No Item Found'));
      } else {
        return Center(child: Text('Try To Search Now'));
      }
    });
  }
}
