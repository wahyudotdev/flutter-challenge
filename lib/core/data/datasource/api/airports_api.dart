import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:traveloka_kw/core/data/model/airport.dart';
import 'package:traveloka_kw/core/data/model/api_response.dart';
part '../../../../gen/core/data/datasource/api/airports_api.g.dart';

@RestApi()
@lazySingleton
abstract class AirportsApi {
  @factoryMethod
  factory AirportsApi(Dio dio) = _AirportsApi;

  @GET('/dummy_/station.json')
  Future<ApiResponse<List<Airport>>> getAirportList();
}
