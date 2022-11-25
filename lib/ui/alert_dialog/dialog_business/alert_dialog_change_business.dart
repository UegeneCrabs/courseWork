import 'package:coursework/domain/use_case_live/live_bloc.dart';
import 'package:flutter/material.dart';

class ChangeBusiness extends StatefulWidget {
  const ChangeBusiness({Key? key, required this.liveBloc}) : super(key: key);
  final LiveBloc liveBloc;

  @override
  State<ChangeBusiness> createState() =>
      _ChangeBusinessState(liveBloc: liveBloc);
}

class _ChangeBusinessState extends State<ChangeBusiness> {
  TextEditingController _idInsuranceChange = TextEditingController();
  TextEditingController _nameChange = TextEditingController();
  TextEditingController _costChange = TextEditingController();
  TextEditingController _idSecondInsuredChange = TextEditingController();
  final LiveBloc liveBloc;

  _ChangeBusinessState({required this.liveBloc});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Изменить страхование Бизнеса'),
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
