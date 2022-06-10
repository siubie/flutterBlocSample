part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final String activityName;
  final String activityType;
  final num participant;

  const HomeLoadedState(this.activityName, this.activityType, this.participant);

  @override
  List<Object> get props => [activityName, activityType, participant];
}

class HomeNoInternetState extends HomeState {
  @override
  List<Object> get props => [];
}
