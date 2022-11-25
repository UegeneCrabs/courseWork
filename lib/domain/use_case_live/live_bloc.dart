import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:coursework/domain/repository/table_repository.dart';
import 'package:meta/meta.dart';
import 'package:pluto_grid/pluto_grid.dart';

part 'live_event.dart';
part 'live_state.dart';

class LiveBloc extends Bloc<LiveEvent, LiveState> {
  LiveBloc({required this.request})
      : super(TableLiveState(rowsLiveWidget: [])) {
    on<AddLiveEvent>(_addLiveEvent);
    on<LoadingDataTableLive>(_loadingDateTableLive);
    on<ChangedSelectedTableLiveEvent>(_changedSelectedTableLiveEvent);
    on<ChangeLiveEvent>(_changeLiveEvent);
    on<DeleteLiveEvent>(_deleteLiveEvent);
  }

  final TablesRepository request;

  _deleteLiveEvent(DeleteLiveEvent event, Emitter<LiveState> emit) {
    _rowsLiveWidget.removeAt(_selectedLiveWidgetRow);
    emit(TableLiveState(rowsLiveWidget: _rowsLiveWidget));
  }

  _changeLiveEvent(ChangeLiveEvent event, Emitter<LiveState> emit) {
    final itemRow = PlutoRow(
      cells: {
        'text_Name': PlutoCell(value: event.name),
        'text_Cost': PlutoCell(value: event.cost),
        'text_ID': PlutoCell(value: event.id),
        'text_IDNext': PlutoCell(value: event.idSecond),
      },
    );
    _rowsLiveWidget[_selectedLiveWidgetRow] = itemRow;
    emit(TableLiveState(rowsLiveWidget: _rowsLiveWidget));
  }

  _loadingDateTableLive(
      LoadingDataTableLive event, Emitter<LiveState> emit) async {
    _searchedTable = await request.onStartLoadOrganisationsRows();
    _rowsLiveWidget = _searchedTable.keys.toList();
    emit(TableLiveState(rowsLiveWidget: _rowsLiveWidget));
  }

  _addLiveEvent(AddLiveEvent event, Emitter<LiveState> emit) {
    final item = PlutoRow(
      cells: {
        'text_Name': PlutoCell(value: event.name),
        'text_Cost': PlutoCell(value: event.cost),
        'text_ID': PlutoCell(value: event.id),
        'text_IDNext': PlutoCell(value: event.idSecond),
      },
    );
    //request.onAddOrganisation(event.name, event.cost, event.id, event.idSecond);
    _rowsLiveWidget.add(item);
    emit(TableLiveState(rowsLiveWidget: _rowsLiveWidget));
  }

  _changedSelectedTableLiveEvent(
      ChangedSelectedTableLiveEvent event, Emitter<LiveState> emit) {
    _selectedLiveWidgetRow = event.selectedRow!;
  }
}
