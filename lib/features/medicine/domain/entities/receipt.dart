import 'package:equatable/equatable.dart';
import 'package:medicine_manager/features/medicine/domain/entities/medicine.dart';
import 'package:meta/meta.dart';

class Receipt extends Equatable{
  final String billNumber;
  final List<Medicine> medicines;
  final double amountPayable;
  final double tax;

  Receipt({
    @required this.billNumber,
    @required this.medicines,
    @required this.amountPayable,
    @required this.tax,
  });

  @override
  List<Object> get props => [billNumber, medicines, amountPayable, tax];
}
