import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:medicine_manager/core/error/failures.dart';
import 'package:medicine_manager/core/usecase/usecase.dart';
import 'package:medicine_manager/features/medicine/domain/entities/medicine.dart';
import 'package:medicine_manager/features/medicine/domain/repositories/medicine.repository.dart';
import 'package:meta/meta.dart';

class AddMedicine implements UseCase<Medicine,Params>
{
  final MedicineRepository medicineRepository;

  AddMedicine({
    @required this.medicineRepository,
  });

  Future<Either<Failure, Medicine>> call(Params params) async
  {
    return await medicineRepository.createMedicine(params.medicine);
  }
}

class Params extends Equatable
{
  final Medicine medicine;

  @override
  Params({this.medicine});
  List<Object> get props => throw UnimplementedError();
  
}