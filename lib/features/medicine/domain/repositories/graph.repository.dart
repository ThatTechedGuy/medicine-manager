import 'package:dartz/dartz.dart';
import 'package:medicine_manager/core/error/failures.dart';

abstract class StatisticsRepository {
  Future<Either<Failure, String>> updateTodayTotalSale();
  Future<Either<Failure, String>> updateMonthTotalSale();
}