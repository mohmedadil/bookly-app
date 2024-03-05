import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo_implementation.dart';
import 'package:bookly/features/home/presentation/manager/similarbook/similarbooks_cubit.dart';
import 'package:bookly/features/home/presentation/views/details_view.dart';
import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:bookly/features/search/presentation/manager/fetchsearch/fetchsearch_cubit.dart';
import 'package:bookly/features/search/presentation/views/search.dart';
import 'package:bookly/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => SplashView(),
      ),
      GoRoute(
        path: '/search',
        builder: (context, state) => BlocProvider(
          create: (context) => FetchsearchCubit(getIt.get<HomeRepoImepl>()),
          child: SearchView(),
        ),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => HomeView(),
      ),
      GoRoute(
        path: '/detailsview',
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarbooksCubit(getIt.get<HomeRepoImepl>()),
          child: DetailsView(book: state.extra as BookModel),
        ),
      ),
    ],
  );
}
