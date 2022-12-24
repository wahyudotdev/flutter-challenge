import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part '../../../gen/core/data/model/airport.g.dart';

@JsonSerializable()
class Airport extends Equatable {
  @JsonKey(name: 'airport_name')
  final String? airportName;
  @JsonKey(name: 'business_id')
  final String? businessId;
  @JsonKey(name: 'airport_code')
  final String? airportCode;
  @JsonKey(name: 'business_name_trans_id')
  final String? businessNameTransId;
  @JsonKey(name: 'location_name')
  final String? locationName;
  @JsonKey(name: 'country_id')
  final String? countryId;
  @JsonKey(name: 'country_name')
  final String? countryName;
  final String? label;

  const Airport({
    this.airportName,
    this.businessId,
    this.airportCode,
    this.businessNameTransId,
    this.locationName,
    this.countryId,
    this.countryName,
    this.label,
  });

  factory Airport.fromJson(Map<String, dynamic> json) {
    return _$AirportFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AirportToJson(this);

  @override
  List<Object?> get props {
    return [
      airportName,
      businessId,
      airportCode,
      businessNameTransId,
      locationName,
      countryId,
      countryName,
      label,
    ];
  }
}
