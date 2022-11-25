import 'package:coursework/domain/use_case_live/live_bloc.dart';
import 'package:flutter/material.dart';

class ChangeRealty extends StatefulWidget {
  const ChangeRealty({Key? key, required this.liveBloc}) : super(key: key);
  final LiveBloc liveBloc;

  @override
  State<ChangeRealty> createState() => _ChangeRealtyState(liveBloc: liveBloc);
}

class _ChangeRealtyState extends State<ChangeRealty> {
  TextEditingController _idInsuranceChange = TextEditingController();
  TextEditingController _nameChange = TextEditingController();
  TextEditingController _costChange = TextEditingController();
  TextEditingController _idSecondInsuredChange = TextEditingController();
  final LiveBloc liveBloc;

  _ChangeRealtyState({required this.liveBloc});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Изменить страхование Недвижимости'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 200,
            child: Column(
              children: [
                TextField(
                  controller: _idInsuranceChange,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'ID Страхования'),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _nameChange,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Наименование'),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _costChange,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Стоимость'),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _idSecondInsuredChange,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'ID страхового случая'),
                )
              ],
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context), child: Text('Cancel')),
        TextButton(
            onPressed: () {
              liveBloc.add(ChangeLiveEvent(
                name: _nameChange.text,
                cost: int.parse(_costChange.text),
                id: int.parse(_idInsuranceChange.text),
                idSecond: int.parse(_idSecondInsuredChange.text),
              ));
            },
            child: const Text('Change')),
      ],
    );
  }
}
