import 'package:dartz/dartz.dart';
import 'package:kasir_mobile/core/error/failure.dart';
import 'package:kasir_mobile/features/products/domain/entities/transaction_entity.dart';

abstract class ProductRepo {
  Future<Either<Failure, Unit>> addTransaction(TransactionEntity transactionEntity);
}
