import 'package:flutter/material.dart';

import '../../../const/const.dart';
import '../../main_screen/main_screen.dart';

class UpButton extends StatefulWidget {
  const UpButton({Key? key}) : super(key: key);

  @override
  State<UpButton> createState() => _UpButtonState();
}

class _UpButtonState extends State<UpButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xDDA0DD).withOpacity(0.5),
      child: Row(
        children: [
          SizedBox(height: 20),
          ElevatedButton(
              style: appButtonStyleBack,
              onPressed: () {
                _navigateToNextScreen(context);
              },
              child: const Text("Назад")),
          SizedBox(width: 20),
          ElevatedButton(
              style: appButtonStyle, onPressed: () {}, child: const Text("2")),
          SizedBox(width: 20),
          ElevatedButton(
              style: appButtonStyle, onPressed: () {}, child: const Text("3")),
        ],
      ),
    );
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MainScreen()));
  }
}
