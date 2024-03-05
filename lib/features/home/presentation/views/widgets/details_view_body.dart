import 'package:bookly/core/utils/style.dart';
import 'package:bookly/core/widgets/custom_button.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/Custom_book_Item.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_action.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/details_appbar.dart';
import 'package:bookly/features/home/presentation/views/widgets/similiarbookslistview.dart';
import 'package:flutter/material.dart';

class Details_View_body extends StatelessWidget {
  const Details_View_body({super.key, required this.book});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Details_Appbar(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.2),
              child: Custom_Book_Item(
                  imageUrl: book.volumeInfo.imageLinks?.thumbnail ?? ''),
            ),
            const SizedBox(
              height: 43,
            ),
            Text(
              book.volumeInfo.title!,
              style: Styles.textStyle30,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 6,
            ),
            Opacity(
              opacity: 0.7,
              child: Text(
                book.volumeInfo.authors?[0] ?? "",
                style: Styles.textStyle18.copyWith(
                    fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            const BookRating(
                mainAxisAlignment: MainAxisAlignment.center,
                count: 5,
                rating: 5),
            const SizedBox(
              height: 37,
            ),
             BookAction(book: book),
            const SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'you can also like',
                style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const SimilarBookListView(),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
