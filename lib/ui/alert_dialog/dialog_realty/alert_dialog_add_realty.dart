import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../domain/use_case_live/live_bloc.dart';

List<int> id = <int>[1, 2, 3, 4];
List<int> idNext = <int>[11, 22, 33, 44];

class AddRealty extends StatefulWidget {
  const AddRealty({Key? key, required this.liveBloc}) : super(key: key);

  final LiveBloc liveBloc;

  @override
  State<AddRealty> createState() => _AddRealtyState(liveBloc: liveBloc);
}

class _AddRealtyState extends State<AddRealty> {
  DateTime selectedDate = DateTime.now();
  TextEditingController _idInsurance = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _cost = TextEditingController();
  TextEditingController _idSecondInsured = TextEditingController();
  final LiveBloc liveBloc;

  void initState() {
    super.initState();
    dropdown1Value = null;
    dropdown2Value = idNext.first;
  }

  late var dropdown1Value;
  late int dropdown2Value;

  bool validateNameTextField = false;
  bool validateCostTextField = false;
  bool validateIDTextField = false;
  bool validateIDNextTextField = false;

  _AddRealtyState({required this.liveBloc});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      title: const Text('Добавить страхование Недвижимости'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 200,
            child: Column(
              children: [
                TextField(
                  maxLength: 5,
                  controller: _idInsurance,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'ID Страхования',
                    errorText: validateIDTextField ? 'Введите значение' : null,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  maxLength: 15,
                  controller: _name,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r"[A-Z-a-z]"))
                  ],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Наименование',
                    errorText:
                        validateNameTextField ? 'Введите значение' : null,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  maxLength: 10,
                  controller: _cost,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Стоимость',
                    errorText:
                        validateCostTextField ? 'Введите значение' : null,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  maxLength: 5,
                  controller: _idSecondInsured,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'ID страхового случая',
                    errorText:
                        validateIDNextTextField ? 'Введите значение' : null,
                  ),
                ),
                Container(
                  width: 300,
                  margin: const EdgeInsets.only(bottom: 5, left: 8),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'ID работника',
                    style: TextStyle(fontSize: 13, color: Colors.black38),
                  ),
                ),
                Container(
                  width: 300,
                  /*margin: const EdgeInsets.only(left: 3, right: 3, bottom: 3),*/
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black38, width: 1.2),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<int>(
                      focusColor: Colors.transparent,
                      isExpanded: true,
                      //hint: Text('Выберите значение'),
                      value: dropdown1Value,
                      alignment: Alignment.center,
                      items: id.map<DropdownMenuItem<int>>((int value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text(value.toString()),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          dropdown1Value = value!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          /*Container(
              width: 200,
              child: ElevatedButton(
                style: appButtonStyleBack,
                onPressed: () {
                  _selectDate(context);
                },
                child: Text('${selectedDate.toLocal()}'.split(' ')[0]),
              )),*/
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            if (_idInsurance.text.isEmpty ||
                _name.text.isEmpty ||
                _cost.text.isEmpty ||
                _idSecondInsured.text.isEmpty ||
                dropdown1Value == null) {
              setState(() {
                validateCostTextField = true;
                validateNameTextField = true;
                validateIDNextTextField = true;
                validateIDTextField = true;
              });
            } else {
              Navigator.pop(context);
              liveBloc.add(AddLiveEvent(
                name: _name.text,
                cost: int.parse(_cost.text),
                id: dropdown1Value,
                idSecond: int.parse(_idSecondInsured.text),
              ));
            }
          },
          child: const Text('Edit'),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}
