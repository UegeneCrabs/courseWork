import 'package:coursework/resources/resources.dart';
import 'package:flutter/material.dart';

import '../main_screen/main_screen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _password = TextEditingController();
  TextEditingController _name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.transparent,
      body: Container(
        width: 1400,
        height: 1000,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Images.fon), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Text("Search by chief"),
                  //SizedBox(width: 96),
                  Container(
                    width: 200,
                    child: TextField(
                      controller: _name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Имя пользователя',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Text("Search by organisation"),
                  //SizedBox(width: 50),
                  Container(
                    width: 200,
                    child: TextField(
                      controller: _password,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Пароль',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                ElevatedButton(
                    style: appButtonStyle,
                    onPressed: () {
                      if (_name.text == "123" && _password.text == "123") {
                        _navigateToNextScreen(context);
                      }
                    },
                    child: const Text("Log In"))
              ])
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MainScreen()));
  }

  var appButtonStyle = ElevatedButton.styleFrom(
    shadowColor: Colors.greenAccent,
    elevation: 3,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
    minimumSize: Size(100, 50),
  );
}
