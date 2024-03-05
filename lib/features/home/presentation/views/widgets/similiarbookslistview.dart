import 'package:bookly/features/home/presentation/manager/similarbook/similarbooks_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/Custom_book_Item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBookListView extends StatelessWidget {
  const SimilarBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarbooksCubit, SimilarbooksState>(
      builder: (context, state) {
        if (state is SimilarbooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.builder(
                itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Custom_Book_Item(
                        imageUrl: state.books[index].volumeInfo.imageLinks
                                ?.thumbnail ??
                            ''),
                  );
                }),
          );
        } else if (state is SimilarbooksFailure) {
          return Text(state.errMessage);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
