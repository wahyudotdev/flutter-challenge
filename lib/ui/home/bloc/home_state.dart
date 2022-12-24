part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class AirportResultState extends HomeState {
  final Status status;
  final String? message;
  final List<ListSection<Airport>>? data;

  const AirportResultState({
    required this.status,
    this.message,
    this.data,
  });

  @override
  List<Object?> get props => [status, message, data];
}
