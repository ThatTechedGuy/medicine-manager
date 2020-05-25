import 'package:dartz/dartz.dart';
import 'package:medicine_manager/core/error/failures.dart';
import 'package:medicine_manager/features/medicine/domain/entities/medicine.dart';
import 'package:medicine_manager/features/medicine/domain/entities/receipt.dart';

abstract class MedicineRepository {
  Future<Either<Failure, Medicine>> getMedicineById(String id);

  Future<Either<Failure, Medicine>> createMedicine(Medicine medicine);

  Future<Either<Failure, Medicine>> updateMedicineQuantity(String id, int quantity);

  Future<Either<Failure, Medicine>> updateMedicineAverageSale(double avgSale);

  Future<Either<Failure, Map<String, List<Medicine>>>> getMedicinesBelowMinimumQuantity();

  Future<Either<Failure, Map<String, List<Medicine>>>> getExpiredMedicines();

  Future<Either<Failure, Map<String, List<Medicine>>>> getMedicinesSoldToday();

  Future<Either<Failure, Medicine>> deleteMedicine(String id);

  Future<Either<Failure, Receipt>> generateReciept(List<Medicine> medicineList);
}
