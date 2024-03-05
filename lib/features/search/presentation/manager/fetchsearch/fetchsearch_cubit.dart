import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'fetchsearch_state.dart';

class FetchsearchCubit extends Cubit<FetchsearchState> {
  FetchsearchCubit(this.homeRepo) : super(FetchsearchInitial());
 final HomeRepo homeRepo;
  Future<void> fetchSearchResult({required String search}) async {
    emit(FetchsearchLoading());
    var result = await homeRepo.fetchSearchResult(search: search);
    result.fold((failure) {
      emit(FetchsearchFailure(failure.errMessage));
    }, (books) {
      emit(FetchsearchSuccess(books));
    });
  }
}
