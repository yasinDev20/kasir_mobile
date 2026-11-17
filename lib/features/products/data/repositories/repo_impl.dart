import 'package:dartz/dartz.dart';
import 'package:kasir_mobile/core/error/failure.dart';
import 'package:kasir_mobile/core/helpers/run_catching.dart';
import 'package:kasir_mobile/features/products/data/datasources/local_datasource.dart';
import 'package:kasir_mobile/features/products/data/models/transaction_model.dart';
import 'package:kasir_mobile/features/products/domain/entities/transaction_entity.dart';
import 'package:kasir_mobile/features/products/domain/repositories/repo.dart';

class ProductRepoImpl extends ProductRepo {
  final LocalDatasource localDatasource;

  new({required this.localDatasource});

  @override
  Future<Either<Failure, Unit>> addTransaction(
    TransactionEntity transactionEntity,
  ) async {
    final model = TransactionModel.fromEntity(transactionEntity);

    return runCatching(() async {
      await localDatasource.addTransaction(model);

      return unit;
    });
  }
}
