import 'package:coursework/domain/use_case_live/live_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluto_grid/pluto_grid.dart';

class TableW extends StatefulWidget {
  const TableW({Key? key}) : super(key: key);

  @override
  State<TableW> createState() => _TableWState();
}

class _TableWState extends State<TableW> {
  late final PlutoGridStateManager stateManager;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LiveBloc, LiveState>(
      listener: (context, state) {
        if (state is TableLiveState) {
          stateManager.removeAllRows();
          stateManager.appendRows(state.rowsLiveWidget);
        }
      },
      builder: (context, state) {
        if (state is TableLiveState) {
          PlutoGrid table =
              buildPlutoGrid(state.columLive, state.rows, context);
          stateManager.notifyListeners();
        }
        return table;
      },
    );
  }

  PlutoGrid buildPlutoGrid(List<PlutoColumn> columns, List<PlutoRow> rows) {
    return PlutoGrid(
      mode: PlutoGridMode.selectWithOneTap,
      configuration: PlutoGridConfiguration(
        columnSize:
            PlutoGridColumnSizeConfig(autoSizeMode: PlutoAutoSizeMode.equal),
      ),
      columns: columns,
      rows: rows,
      onSelected: (PlutoGridOnSelectedEvent event) {
        final tableOrganisationBloc = BlocProvider.of<LiveBloc>(context);
        tableOrganisationBloc
            .add(ChangedSelectedTableLiveEvent(selectedRow: event.rowIdx));
      },
      onLoaded: (event) => stateManager = event.stateManager,
    );
  }
}
