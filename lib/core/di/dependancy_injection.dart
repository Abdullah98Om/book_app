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
    getIt.registerLazySingleton<BooksServices>(() => BooksServices());

    // // Product Service
    // getIt.registerLazySingleton<ProductService>(
    //     () => ProductService(getIt<DioClient>()));

    // // Community Service
    // getIt.registerLazySingleton<CommunityServices>(
    //     () => CommunityServices(getIt<DioClient>()));

    // // cart Service
    // getIt.registerLazySingleton<CartServices>(
    //     () => CartServices(getIt<SqlDb>()));

    // // Order Service
    // getIt.registerLazySingleton<OrderServices>(
    //     () => OrderServices(getIt<DioClient>()));

    /////////////////////////////////////////////////////////////////////////////////////////////////////
    //////////////////////////////////// Bloc && Cubit ///////////////////////////////////////////////////////////////////////////////////

    // Books Cubit
    getIt.registerLazySingleton<BooksCubit>(
        () => BooksCubit(getIt<BooksServices>()));

    // // Index Cubit
    // getIt.registerFactory<IndexCubit>(() => IndexCubit());

    // // Register Cubit
    // getIt.registerFactory<RegisterCubit>(
    //     () => RegisterCubit(getIt<AuthService>()));

    // // Profile Cubit
    // getIt.registerFactory<ProfileCubit>(
    //     () => ProfileCubit(getIt<AuthService>()));

    // // Products Star Cubit
    // getIt.registerFactory<ProductsStarCubit>(
    //     () => ProductsStarCubit(getIt<ProductService>()));

    // // Product Cubit
    // getIt.registerFactory<ProductCubit>(
    //     () => ProductCubit(getIt<ProductService>()));

    // // Product Detailes Cubit
    // getIt.registerFactory<ProductDetailesCubit>(() => ProductDetailesCubit(
    //     // getIt<ProductCubit>()
    //     ));

    // // Products Section Cubit
    // getIt.registerFactory<ProductsSectionCubit>(
    //     () => ProductsSectionCubit(getIt<ProductService>()));

    // // Products Search Cubit
    // getIt.registerFactory<ProductSearchCubit>(
    //     () => ProductSearchCubit(getIt<ProductService>()));

    // // Section Cubit
    // getIt.registerFactory<SectionCubit>(
    //     () => SectionCubit(getIt<ProductService>()));

    // // Order Cubit
    // getIt.registerFactory<OrdersCubit>(
    //     () => OrdersCubit(getIt<OrderServices>()));

    // // Designer Cubit
    // getIt.registerFactory<DesignerCubit>(() => DesignerCubit());

    // // Shaipping Cubit
    // getIt.registerFactory<ShaippingCubit>(
    //     () => ShaippingCubit(getIt<OrderServices>()));

    // // Cart Cubit
    // getIt.registerFactory<CartCubit>(
    //     () => CartCubit(getIt<CartServices>(), getIt<ProductService>()));

    // // Community Cubit
    // getIt.registerFactory<CommunityCubit>(
    //     () => CommunityCubit(getIt<CommunityServices>()));
  }
}
