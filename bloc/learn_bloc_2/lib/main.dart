import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnbloc2/CounterBloc.dart';
import 'package:learnbloc2/CounterScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "sdf",
      home: BlocProvider<CounterBloc>(
        create: (context) => CounterBloc(),
        child: CounterScreen(),
      ),
    );
  }
}
