// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:kasir_mobile/features/products/domain/entities/product_entity.dart';

class TransactionEntity extends Equatable {
  final String id;
  final ProductEntity product;
  final int quantity;
  final int price;
  final DateTime createdAt;
  final DateTime updatedAt;

  const new({
    required this.id,
    required this.product,
    required this.quantity,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object> get props {
    return [id, product, quantity, price, createdAt, updatedAt];
  }
}
