part of 'internet_bloc.dart';

@immutable
sealed class InternetState {}

final class InternetInitial extends InternetState {}
class ConnectedState extends InternetState{
  final String msg;

  ConnectedState({required this.msg});
}
class NotConnectedState extends InternetState{
  final String msg;

  NotConnectedState({required this.msg});
}