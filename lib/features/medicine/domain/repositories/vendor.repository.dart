import 'package:dartz/dartz.dart';
import 'package:medicine_manager/core/error/failures.dart';
import 'package:medicine_manager/features/medicine/domain/entities/medicine.dart';

abstract class VendorRepository
{
  Future<Either<Failure, Medicine>> addMedicine(Medicine medicine);

  Future<Either<Failure, Medicine>> deleteMedicine(Medicine medicine);

  Future<Either<Failure, Medicine>> updateMedicine(Medicine medicine);
}