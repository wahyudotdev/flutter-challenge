import 'package:dartz/dartz.dart';
import 'package:traveloka_kw/core/data/model/airport.dart';
import 'package:traveloka_kw/core/utils/failure.dart';

abstract class AirportRepository {
  Future<Either<Failure, List<Airport>>> getAirportList();
}
