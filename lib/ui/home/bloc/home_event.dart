part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetAirportListEvent extends HomeEvent {
  @override
  List<Object> get props => [];
}

class FilterAirportEvent extends HomeEvent {
  final String query;

  const FilterAirportEvent(this.query);

  @override
  List<Object> get props => [query];
}
