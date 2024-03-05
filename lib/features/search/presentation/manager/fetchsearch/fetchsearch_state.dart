part of 'fetchsearch_cubit.dart';

sealed class FetchsearchState extends Equatable {
  const FetchsearchState();

  @override
  List<Object> get props => [];
}

final class FetchsearchInitial extends FetchsearchState {}

final class FetchsearchLoading extends FetchsearchState {}

final class FetchsearchSuccess extends FetchsearchState {
  final List<BookModel> books;

const  FetchsearchSuccess(this.books);
}

final class FetchsearchFailure extends FetchsearchState {
    final String errMessage;

const  FetchsearchFailure(this.errMessage);

}
