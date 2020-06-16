import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnbloc/Home.dart';
import 'package:learnbloc/Settings.dart';
import 'package:learnbloc/bloc/SettingBloc.dart';

void main() {
  final BlocProvider<SettingBloc> blocProvider = BlocProvider<SettingBloc>(
    create: (_) => SettingBloc(),
    child: MyApp(),
  );

  runApp(blocProvider);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/' : (context) => Home(),
        '/about' : (context) => Home(),
        '/settings' : (context) => Settings(),
      },
    );
  }
}


