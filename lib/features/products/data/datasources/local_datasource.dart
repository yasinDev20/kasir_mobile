import 'package:kasir_mobile/features/products/data/models/transaction_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

abstract class LocalDatasource {
  Future<void> addTransaction(TransactionModel transaction);
}

class LocalDatasourceImpl extends LocalDatasource {
  final Database database;

  LocalDatasourceImpl({required this.database});

  @override
  Future<void> addTransaction(TransactionModel transaction) async {
    await database.insert('transactions', {
      'id': Uuid().v7(),
      'product_id': transaction.product.id,
      'quantity': transaction.quantity,
      'price': transaction.price,
      'created_at': transaction.createdAt,
      'updated_at': transaction.updatedAt,
    });
  }
}
