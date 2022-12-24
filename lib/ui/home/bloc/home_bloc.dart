import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:traveloka_kw/core/data/model/airport.dart';
import 'package:traveloka_kw/core/data/model/list_section.dart';
import 'package:traveloka_kw/core/data/repository/airport_repository.dart';
import 'package:traveloka_kw/core/utils/bloc_transformer.dart';
import 'package:traveloka_kw/core/utils/status.dart';
import 'package:collection/collection.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  var _cache = <Airport>[];

  final AirportRepository _repository;

  HomeBloc(this._repository) : super(HomeInitial()) {
    on<GetAirportListEvent>(((event, emit) async {
      emit(const AirportResultState(status: Status.loading));
      final result = await _repository.getAirportList();
      result.fold(
          (failure) => emit(AirportResultState(
              status: Status.error, message: failure.message)), (data) {
        _cache = data;
        return emit(
            AirportResultState(status: Status.success, data: _toSection(data)));
      });
    }));

    on<FilterAirportEvent>(((event, emit) {
      var filter = event.query.toLowerCase();
      var filtered = _cache.where((element) =>
          (element.airportName?.toLowerCase().contains(filter) ?? false) ||
          (element.locationName?.toLowerCase().contains(filter) ?? false) ||
          (element.countryName?.toLowerCase().contains(filter) ?? false));

      var result = _toSection(filtered);

      emit(AirportResultState(status: Status.success, data: result));
    }), transformer: debounceSequential(const Duration(seconds: 1)));
  }

  List<ListSection<Airport>> _toSection(Iterable<Airport> airports) {
    return airports
        .groupListsBy((element) => element.countryName)
        .map((key, value) => MapEntry(key, ListSection(value)))
        .values
        .sorted((a, b) =>
            a.data.first.countryName!.compareTo(b.data.first.countryName!))
        .toList();
  }
}
