// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
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
}
