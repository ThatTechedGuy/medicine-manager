import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:medicine_manager/features/medicine/domain/entities/medicine.dart';

class Vendor extends Equatable {
  final String id;
  final String name;
  final String address;
  final int phoneNumber;
  final String email;
  final List<Medicine> medicineList;

  Vendor({
    @required this.id,
    @required this.name,
    @required this.address,
    @required this.phoneNumber,
    @required this.email,
    @required this.medicineList,
  });

  @override
  List<Object> get props =>
      [id, name, address, phoneNumber, email, medicineList];
}
