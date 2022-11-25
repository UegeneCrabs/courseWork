part of 'live_bloc.dart';

@immutable
abstract class LiveEvent {}

class AddLiveEvent extends LiveEvent {
  final String name;
  final int cost;
  final int id;
  final int idSecond;

  AddLiveEvent(
      {required this.name,
      required this.cost,
      required this.id,
      required this.idSecond});
}

class ChangeLiveEvent extends LiveEvent {
  final String name;
  final int cost;
  final int id;
  final int idSecond;

  ChangeLiveEvent(
      {required this.name,
      required this.cost,
      required this.id,
      required this.idSecond});
}

class DeleteLiveEvent extends LiveEvent {}

class LoadingDataTableLive extends LiveEvent {}

class ChangedSelectedTableLiveEvent extends LiveEvent {
  final int? selectedRow;

  ChangedSelectedTableLiveEvent({required this.selectedRow});
}
