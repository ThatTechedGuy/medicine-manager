import 'package:equatable/equatable.dart';
import 'package:medicine_manager/features/medicine/domain/entities/vendor.dart';

class Medicine extends Equatable {
  final String id;
  final String name;
  final int quantity;
  final int minimumQuantity;
  final int quantitySold;
  final int quantityRequired;
  final int avgSale;
  final double price;
  final String description;
  final Vendor vendor;
  final DateTime lastSold;
  final DateTime expiryDate;
  final bool hasExpired;

  Medicine({
    this.id,
    this.name,
    this.quantity,
    this.minimumQuantity,
    this.quantitySold,
    this.quantityRequired,
    this.avgSale,
    this.price,
    this.description,
    this.vendor,
    this.lastSold,
    this.expiryDate,
    this.hasExpired,
  });

  @override
  List<Object> get props => [
        id,
        name,
        quantity,
        minimumQuantity,
        quantitySold,
        avgSale,
        price,
        description,
        vendor,
        lastSold,
        expiryDate,
        hasExpired
      ];
}
