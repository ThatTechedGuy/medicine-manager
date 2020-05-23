import 'package:medicine_manager/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:medicine_manager/core/usecase/usecase.dart';
import 'package:medicine_manager/features/medicine/domain/entities/receipt.dart';
import 'package:medicine_manager/features/medicine/domain/repositories/graph.repository.dart';
import 'package:medicine_manager/features/medicine/domain/repositories/medicine.repository.dart';

class SellMedicine implements UseCase {
  final MedicineRepository medicineRepository;
  final StatisticsRepository statisticsRepository;

  SellMedicine(this.medicineRepository, this.statisticsRepository);

  @override
  Future<Either<Failure, Receipt>> call(params) {
  }
}
