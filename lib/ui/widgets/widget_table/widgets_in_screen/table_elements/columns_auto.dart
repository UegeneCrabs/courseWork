import 'package:pluto_grid/pluto_grid.dart';

List<PlutoColumn> columnsAuto = [
  PlutoColumn(
    title: 'Name Auto',
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
