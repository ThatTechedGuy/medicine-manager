import 'package:dartz/dartz.dart';
import 'package:medicine_manager/core/error/failures.dart';
import 'package:medicine_manager/core/usecase/usecase.dart';
import 'package:medicine_manager/features/medicine/domain/entities/medicine.dart';
import 'package:medicine_manager/features/medicine/domain/repositories/medicine.repository.dart';
import 'package:meta/meta.dart';

class GenerateExpiredMedicineList implements UseCase<Map<String, List<Medicine>>,NoParams>
{
  final MedicineRepository medicineRepository;

  GenerateExpiredMedicineList({
    @required this.medicineRepository,
  });

  Future<Either<Failure, Map<String, List<Medicine>>>> call(NoParams params) async
  {
    return await medicineRepository.getExpiredMedicines(); 
  }
}
