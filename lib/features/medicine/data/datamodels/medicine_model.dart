import 'package:medicine_manager/features/medicine/domain/entities/medicine.dart';
import 'package:medicine_manager/features/medicine/domain/entities/vendor.dart';

class MedicineModel extends Medicine {
  final String id;
  final String name;
  final int quantity;
  final int minimumQuantity;
  final double avgSalePerWeek;
  final double price;
  final String description;
  final Vendor vendor;
  final DateTime lastSold;
  final DateTime expiryDate;
  final bool hasExpired;

  MedicineModel({
    this.id,
    this.name,
    this.quantity,
    this.minimumQuantity,
    this.avgSalePerWeek,
    this.price,
    this.description,
    this.vendor,
    this.lastSold,
    this.expiryDate,
    this.hasExpired,
  }) : super(
          id: id,
          name: name,
          quantity: quantity,
          minimumQuantity: minimumQuantity,
          avgSalePerWeek: avgSalePerWeek,
          price: price,
          description: description,
          vendor: vendor,
          expiryDate: expiryDate,
          hasExpired: hasExpired,
        );
}
