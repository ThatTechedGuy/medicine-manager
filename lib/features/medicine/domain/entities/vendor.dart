import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Vendor extends Equatable {
  final String vendorId;
  final String vendorName;
  final String vendorAddress;
  final int vendorPhoneNumber;
  final String vendorEmail;

  Vendor({
    @required this.vendorId,
    @required this.vendorName,
    @required this.vendorAddress,
    @required this.vendorPhoneNumber,
    @required this.vendorEmail,
  });

  @override
  List<Object> get props =>
      [vendorId, vendorName, vendorAddress, vendorPhoneNumber, vendorEmail];
}
