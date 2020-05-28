import 'package:medicine_manager/features/medicine/data/datamodels/medicine_model.dart';
import 'package:medicine_manager/features/medicine/domain/entities/medicine.dart';

abstract class RemoteDataSource
{
  Future<MedicineModel> getMedicineByid(String id);

  Future<MedicineModel> createMedicine(Medicine medicine);

  Future<MedicineModel> deleteMedicine(String id);

  Future<MedicineModel> updateMedicineQuantity(String id, int quantity);

  Future<MedicineModel> updateMedicineAverageSale(double avgSale);

  Future<Map<String, List<MedicineModel>>>
      getMedicinesBelowMinimumQuantity();

  Future<Map<String, List<MedicineModel>>> getExpiredMedicines();

  Future<Map<String, List<MedicineModel>>> getMedicinesSoldToday();
}