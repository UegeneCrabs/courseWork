import 'dart:io';
import 'package:coursework/domain/repository/table_repository.dart';
import 'package:coursework/domain/use_case_live/live_bloc.dart';
import 'package:coursework/repositorye/live_repositorye_impl.dart';
import 'package:coursework/ui/widgets/main_screen/main_screen.dart';
import 'package:coursework/ui/widgets/widget_login/login.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:window_size/window_size.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('Страхование');
    setWindowMinSize(const Size(1400, 1000));
    setWindowMaxSize(const Size(1400, 1000));
  }
  runApp(BlocWrapper());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
      navigatorKey: navigatorKey,
    );
  }
}

class BlocWrapper extends StatelessWidget {
  BlocWrapper({Key? key}) : super(key: key);
  //final TablesRepository repository = TablesRepositoryImplementation();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              LiveBloc(request: TablesRepositoryImplementation())
                ..add(LoadingDataTableLive()),
        ),
      ],
      child: MyApp(),
    );
  }
}
