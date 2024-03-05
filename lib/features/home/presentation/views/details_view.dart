import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/manager/similarbook/similarbooks_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({super.key, required this.book});
  final BookModel book;

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  void initState() {
    BlocProvider.of<SimilarbooksCubit>(context)
        .fetchSimilarBooks(category: widget.book.volumeInfo.categories?[0]??'');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: Details_View_body(book: widget.book,)),
    );
  }
}
