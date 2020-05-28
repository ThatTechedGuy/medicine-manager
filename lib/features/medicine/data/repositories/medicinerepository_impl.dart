import 'package:medicine_manager/features/medicine/data/datasources/remote_datasource.dart';
import 'package:medicine_manager/features/medicine/domain/entities/receipt.dart';
import 'package:medicine_manager/features/medicine/domain/entities/medicine.dart';
import 'package:medicine_manager/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:medicine_manager/features/medicine/domain/repositories/medicine.repository.dart';

class MedicineRepositoryImpl implements MedicineRepository {
  final RemoteDataSource remoteDataSource;

  MedicineRepositoryImpl({this.remoteDataSource});  

  @override
  Future<Either<Failure, Medicine>> getMedicineById(String id) async{
    return Right(await remoteDataSource.getMedicineByid(id));
  }

  @override
  Future<Either<Failure, Medicine>> createMedicine(Medicine medicine) async{
    return Right(await remoteDataSource.createMedicine(medicine));
  }

  @override
  Future<Either<Failure, Medicine>> deleteMedicine(String id) async{
    return Right(await remoteDataSource.deleteMedicine(id));
  }

  @override
  Future<Either<Failure, Medicine>> updateMedicineQuantity(
      String id, int quantity) async{
    return Right(await remoteDataSource.updateMedicineQuantity(id, quantity));
  }

  @override
  Future<Either<Failure, Medicine>> updateMedicineAverageSale(double avgSale) async{
    return Right(await remoteDataSource.updateMedicineAverageSale(avgSale));
  }

  @override
  Future<Either<Failure, Map<String, List<Medicine>>>>
      getMedicinesBelowMinimumQuantity() async{
    return Right(await remoteDataSource.getMedicinesBelowMinimumQuantity());
  }

  @override
  Future<Either<Failure, Map<String, List<Medicine>>>> getExpiredMedicines() async{
    return Right(await remoteDataSource.getExpiredMedicines());
  }

  @override
  Future<Either<Failure, Map<String, List<Medicine>>>> getMedicinesSoldToday() async{
    return Right(await remoteDataSource.getMedicinesSoldToday());
  }

  @override
  Future<Either<Failure, Receipt>> generateReciept(
      List<Medicine> medicineList) {
    // TODO: implement generateReciept
    throw UnimplementedError();
  }
}
