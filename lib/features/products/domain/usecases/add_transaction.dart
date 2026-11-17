import 'package:dartz/dartz.dart';
import 'package:kasir_mobile/core/error/failure.dart';
import 'package:kasir_mobile/features/products/domain/entities/transaction_entity.dart';
import 'package:kasir_mobile/features/products/domain/repositories/repo.dart';

class AddTransactionUseCase {
  final ProductRepo repo;

  new({required this.repo});

  Future<Either<Failure, Unit>> call(
    TransactionEntity transactionEntity,
  ) async {
    return await repo.addTransaction(transactionEntity);
  }
}
