part of 'live_bloc.dart';

@immutable
abstract class LiveState {}

List<PlutoRow> _rowsLiveWidget = [];
int _selectedLiveWidgetRow = -1;
Map<PlutoRow, List<PlutoRow>> _searchedTable = {};

class TableLiveState extends LiveState {
  final List<PlutoRow> rowsLiveWidget;
  //final List<PlutoColumn> columnsLiveWidget = columnsLive;
  TableLiveState({required this.rowsLiveWidget});
}

List<PlutoColumn> columLive = [
  PlutoColumn(
    title: 'Name',
    field: 'text_Name',
    type: PlutoColumnType.text(),
  ),

  /// Text Column definition
  PlutoColumn(
    title: 'Cost',
    field: 'text_Cost',
    type: PlutoColumnType.number(),
  ),

  /// Text Column definition
  PlutoColumn(
    title: 'ID',
    field: 'text_ID',
    type: PlutoColumnType.number(),
  ),
  PlutoColumn(
    title: 'Next IDGuest',
    field: 'text_IDNext',
    type: PlutoColumnType.number(),
  ),
];

List<PlutoColumn> columnsContract = [
  PlutoColumn(
    title: 'Name contract',
    field: 'text_Name',
    type: PlutoColumnType.text(),
  ),

  /// Text Column definition
  PlutoColumn(
    title: 'Cost',
    field: 'text_Cost',
    type: PlutoColumnType.number(),
  ),

  /// Text Column definition
  PlutoColumn(
    title: 'ID',
    field: 'text_ID',
    type: PlutoColumnType.number(),
  ),
  PlutoColumn(
    title: 'Next IDGuest',
    field: 'text_IDNext',
    type: PlutoColumnType.number(),
  ),
];
