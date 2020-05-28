import 'package:medicine_manager/features/medicine/domain/entities/medicine.dart';
import 'package:medicine_manager/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:medicine_manager/features/medicine/domain/repositories/vendor.repository.dart';

class VendorRepositoryImpl implements VendorRepository
{
  @override
  Future<Either<Failure, Medicine>> addMedicine(Medicine medicine) {
      // TODO: implement addMedicine
      throw UnimplementedError();
    }
  
    @override
    Future<Either<Failure, Medicine>> deleteMedicine(Medicine medicine) {
      // TODO: implement deleteMedicine
      throw UnimplementedError();
    }
  
    @override
    Future<Either<Failure, Medicine>> updateMedicine(Medicine medicine) {
    // TODO: implement updateMedicine
    throw UnimplementedError();
  }
  
}