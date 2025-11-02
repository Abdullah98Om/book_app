import 'package:book_app/controller/search/search_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../controller/books/cubit/books_cubit.dart';
import '../../servicies/books_servicies.dart';
import '../util/sqldb.dart';

GetIt getIt = GetIt.instance;

class DependancyInjection {
  static Future<void> init() async {
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////// Servies /////////////////////////////////////////////////////////////////////////////////////////////////////////////

    // SqlDb
    getIt.registerLazySingleton<SqlDb>(() => SqlDb());

    // Books Services
    getIt.registerLazySingleton<BooksServices>(
        () => BooksServices(getIt<SqlDb>()));

    /////////////////////////////////////////////////////////////////////////////////////////////////////
    //////////////////////////////////// Bloc && Cubit ///////////////////////////////////////////////////////////////////////////////////

    // Books Cubit
    getIt.registerLazySingleton<BooksCubit>(
        () => BooksCubit(getIt<BooksServices>()));

    // // Search Cubit
    getIt.registerFactory<SearchCubit>(
        () => SearchCubit(getIt<BooksServices>()));
  }
}
