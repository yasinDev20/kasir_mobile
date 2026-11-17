import 'package:get_it/get_it.dart';
import 'package:kasir_mobile/core/helpers/database.dart';
import 'package:kasir_mobile/features/products/data/datasources/local_datasource.dart';
import 'package:kasir_mobile/features/products/data/repositories/repo_impl.dart';
import 'package:kasir_mobile/features/products/domain/repositories/repo.dart';
import 'package:kasir_mobile/features/products/domain/usecases/add_transaction.dart';
import 'package:sqflite/sqflite.dart';

var sl = GetIt.instance;

Future<void> injectionInit() async {
  //Products feature

  final database = await DatabaseHelper.database;

  sl.registerSingleton<Database>(database);

  sl.registerLazySingleton<LocalDatasource>(
    () => LocalDatasourceImpl(database: sl()),
  );

  sl.registerLazySingleton<ProductRepo>(
    () => ProductRepoImpl(localDatasource: sl()),
  );

  sl.registerLazySingleton(
    () => AddTransactionUseCase(repo: sl()), //diisi AuthRepositoryImpl
  );
}
