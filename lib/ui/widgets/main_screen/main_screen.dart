import 'package:coursework/ui/widgets/widget_login/login.dart';
import 'package:coursework/ui/widgets/widget_table/table.dart';
import 'package:coursework/ui/widgets/widget_table/widgets_in_screen/low_button.dart';
import 'package:flutter/material.dart';
import 'package:coursework/resources/resources.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(Images.fon))),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Страхование Плюс'),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Images.fon2), fit: BoxFit.cover)),
            ),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(Images.fon2), fit: BoxFit.cover),
                    //color: Colors.blue,
                  ),
                  child: Text(
                    'Account',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text('Profile'),
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                ),
                ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text('Exit'),
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Login()));
                  },
                ),
              ],
            ),
          ),
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(flex: 1, child: LowButton()),
                      Expanded(flex: 4, child: Container()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
