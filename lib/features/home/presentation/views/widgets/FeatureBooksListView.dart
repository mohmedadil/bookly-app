import 'package:bookly/features/home/presentation/manager/featurebook/featuredbooks_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/Custom_book_Item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeatureBooksListView extends StatelessWidget {
  const FeatureBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedbooksCubit, FeaturedbooksState>(
      builder: (context, state) {
        if (state is FeaturedbooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Custom_Book_Item(
                        imageUrl:
                            state.books[index].volumeInfo.imageLinks.thumbnail),
                  );
                }),
          );
        } else if (state is FeaturedbooksFailure) {
          return Text(state.errMessage);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
