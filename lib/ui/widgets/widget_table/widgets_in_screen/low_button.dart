import 'package:coursework/domain/use_case_live/live_bloc.dart';
import 'package:coursework/ui/alert_dialog/dialog_auto/alert_dialog_auto_add.dart';
import 'package:coursework/ui/alert_dialog/dialog_auto/alert_dialog_auto_change.dart';
import 'package:coursework/ui/alert_dialog/dialog_business/alert_dialog_add_business.dart';
import 'package:coursework/ui/alert_dialog/dialog_business/alert_dialog_change_business.dart';
import 'package:coursework/ui/alert_dialog/dialog_live/alert_dialog_live_add.dart';
import 'package:coursework/ui/alert_dialog/dialog_live/alert_dialog_live_change.dart';
import 'package:coursework/ui/alert_dialog/dialog_pension/alert_dialog_add_pension.dart';
import 'package:coursework/ui/alert_dialog/dialog_pension/alert_dialog_change_pension.dart';
import 'package:coursework/ui/alert_dialog/dialog_realty/alert_dialog_add_realty.dart';
import 'package:coursework/ui/alert_dialog/dialog_realty/alert_dialog_change_realty.dart';
import 'package:coursework/ui/const/const.dart';
import 'package:coursework/ui/widgets/widget_table/table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LowButton extends StatefulWidget {
  const LowButton({Key? key}) : super(key: key);

  @override
  State<LowButton> createState() => _LowButtonState();
}

late var dropdown1Value;

List<String> nameInsurance = <String>[
  "Страхование Жизни",
  "Страхование Автомобиля",
  "Страхование Недвижимости",
  "Пенсионное Страхование",
  "Бизнесу",
  "Обращения",
  "Договоры"
];

class _LowButtonState extends State<LowButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            focusColor: Colors.transparent,
            isExpanded: true,
            hint: Text('Выберите значение'),
            value: dropdown1Value,
            alignment: Alignment.center,
            items: nameInsurance.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
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
        SizedBox(height: 20),
        ElevatedButton(
            style: appButtonStyle,
            onPressed: () {
              final liveBloc = BlocProvider.of<LiveBloc>(context);
              switch (dropdown1Value.toString()) {
                case "Страхование Жизни":
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AddLive(liveBloc: liveBloc);
                      });
                  break; // The switch statement must be told to exit, or it will execute every case.
                case "Страхование Автомобиля":
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AddAuto(liveBloc: liveBloc);
                      });
                  break;
                case "Страхование Недвижимости":
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AddRealty(liveBloc: liveBloc);
                      });
                  break;
                case "Пенсионное Страхование":
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AddPension(liveBloc: liveBloc);
                      });
                  break;
                case "Бизнесу":
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AddBusiness(liveBloc: liveBloc);
                      });
                  break;
                case "Обращения":
                  break;
                case "Договоры":
                  break;
                default:
                  print('choose a different number!');
              }
            },
            child: const Text("Добавить")),
        SizedBox(height: 20),
        ElevatedButton(
            style: appButtonStyle,
            onPressed: () {
              final liveBloc = BlocProvider.of<LiveBloc>(context);
              switch (dropdown1Value.toString()) {
                case "Страхование Жизни":
                  showDialog(
                      context: context,
                      builder: (context) {
                        return ChangeLive(liveBloc: liveBloc);
                      });
                  break; // The switch statement must be told to exit, or it will execute every case.
                case "Страхование Автомобиля":
                  showDialog(
                      context: context,
                      builder: (context) {
                        return ChangeAuto(liveBloc: liveBloc);
                      });
                  break;
                case "Страхование Недвижимости":
                  showDialog(
                      context: context,
                      builder: (context) {
                        return ChangeRealty(liveBloc: liveBloc);
                      });
                  break;
                case "Пенсионное Страхование":
                  showDialog(
                      context: context,
                      builder: (context) {
                        return ChangePension(liveBloc: liveBloc);
                      });
                  break;
                case "Бизнесу":
                  showDialog(
                      context: context,
                      builder: (context) {
                        return ChangeBusiness(liveBloc: liveBloc);
                      });
                  break;
                case "Обращения":
                  break;
                case "Договоры":
                  break;
                default:
                  print('choose a different number!');
              }
            },
            child: const Text("Изменить")),
        SizedBox(height: 20),
        ElevatedButton(
            style: appButtonStyle,
            onPressed: () {
              final liveBloc = BlocProvider.of<LiveBloc>(context);
              liveBloc.add(DeleteLiveEvent());
            },
            child: const Text("Удалить")),
      ],
    );
  }

  void initState() {
    super.initState();
    dropdown1Value = null;
  }
}
