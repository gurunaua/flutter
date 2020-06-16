import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:learnbloc/DrawerMenu.dart';
import 'package:learnbloc/bloc/SettingBloc.dart';
import 'package:learnbloc/bloc/SettingState.dart';

class Home extends StatelessWidget {

  String text = lorem(paragraphs: 3, words: 50);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coba bloc"),
        backgroundColor: Colors.teal,
      ),
      drawer: DrawerMenu(),
      body: BlocBuilder<SettingBloc, SettingsState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.all(10),
            child: RichText(
              text: TextSpan(
                text: text,
                style: TextStyle(
                  fontSize: state.fontSize,
                  color: Colors.black,
                  fontWeight:state.isBolt ? FontWeight.bold : FontWeight.normal,
                  fontStyle:state.isItalic ? FontStyle.italic : FontStyle.normal,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
