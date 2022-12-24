import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:traveloka_kw/core/data/datasource/api/airports_api.dart';
import 'package:traveloka_kw/core/data/model/airport.dart';
import 'package:dartz/dartz.dart';
import 'package:traveloka_kw/core/data/repository/airport_repository.dart';
import 'package:traveloka_kw/core/utils/failure.dart';

@LazySingleton(as: AirportRepository)
class AirportRepositoryImpl extends AirportRepository {
  final AirportsApi _api;

  AirportRepositoryImpl(this._api);
  @override
  Future<Either<Failure, List<Airport>>> getAirportList() async {
    try {
      final response = await _api.getAirportList();
      return right(response.data);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure(message: e.message));
      }
      return left(UnknownFailure(message: e.toString()));
    }
  }
}
