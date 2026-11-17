// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:kasir_mobile/features/products/data/models/product_model.dart';
import 'package:kasir_mobile/features/products/domain/entities/transaction_entity.dart';

class TransactionModel extends Equatable {
  final String id;
  final ProductModel product;
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

  TransactionEntity toEntity() {
    return TransactionEntity(
      id: id,
      product: product.toEntity(),
      quantity: quantity,
      price: price,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  factory TransactionModel.fromEntity(TransactionEntity entity) {
    return TransactionModel(
      id: entity.id,
      product: ProductModel.fromEntity(entity.product),
      quantity: entity.quantity,
      price: entity.price,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'product': product.toMap(),
      'quantity': quantity,
      'price': price,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      id: map['id'] as String,
      product: ProductModel.fromMap(map['product'] as Map<String, dynamic>),
      quantity: map['quantity'] as int,
      price: map['price'] as int,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionModel.fromJson(String source) =>
      TransactionModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
