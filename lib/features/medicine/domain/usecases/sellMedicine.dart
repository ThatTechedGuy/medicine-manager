import 'package:equatable/equatable.dart';
import 'package:medicine_manager/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:medicine_manager/core/usecase/usecase.dart';
import 'package:medicine_manager/features/medicine/domain/entities/medicine.dart';
import 'package:medicine_manager/features/medicine/domain/entities/receipt.dart';
import 'package:medicine_manager/features/medicine/domain/repositories/medicine.repository.dart';
import 'package:meta/meta.dart';

class SellMedicine implements UseCase<Receipt,Params> {
  final MedicineRepository medicineRepository;

  SellMedicine({
    @required this.medicineRepository,
  });

  @override
  Future<Either<Failure, Receipt>> call(Params params) async{
    for(Medicine medicine in params.medicineList)
    {
      medicineRepository.updateMedicineQuantity(medicine.id, medicine.quantity);
      medicineRepository.updateMedicineAverageSale(medicine.avgSalePerWeek);
    }

    return await medicineRepository.generateReciept(params.medicineList);
  }
}

class Params extends Equatable
{
  final List<Medicine> medicineList;

  Params({this.medicineList});

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
  
}