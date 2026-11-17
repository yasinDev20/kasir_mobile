// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:kasir_mobile/features/products/domain/entities/product_entity.dart';

class ProductModel extends Equatable {
  final String id;
  final String name;
  final String price;
  final String notes;

  const new({
    required this.id,
    required this.name,
    required this.price,
    required this.notes,
  });

  @override
  List<Object> get props => [id, name, price, notes];

  ProductEntity toEntity() {
    return ProductEntity(id: id, name: name, price: price, notes: notes);
  }

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      id: entity.id,
      name: entity.name,
      price: entity.price,
      notes: entity.notes,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'notes': notes,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as String,
      name: map['name'] as String,
      price: map['price'] as String,
      notes: map['notes'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
