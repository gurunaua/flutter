
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnbloc/DrawerMenu.dart';
import 'package:learnbloc/bloc/SettingBloc.dart';
import 'package:learnbloc/bloc/SettingState.dart';
import 'package:learnbloc/bloc/SettingsEvent.dart';

class Settings extends StatelessWidget {
  double _value = 0.5;
  bool isBold = false;
  bool isItalic =false;


  @override
  Widget build(BuildContext context) {

    final SettingBloc settingsBloc = BlocProvider.of<SettingBloc>(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text('Settings'),
        ),
        drawer: DrawerMenu(),
        body: BlocBuilder<SettingBloc, SettingsState>(
          builder: (context, state){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    'Font Size: ${state.fontSize.toInt()}',
                    style: TextStyle(
                        fontSize: Theme.of(context).textTheme.headline.fontSize),
                  ),

                ),
                Slider(
                    min: 0.5,
                    value: state.sliderFontSize,
                    onChanged: (newValue) {
                      settingsBloc.add(FontSize(newValue));
                    }),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: <Widget>[
                      Checkbox(
                        value: state.isBolt,
                        onChanged: (newVal) {
                          settingsBloc.add(Bold(newVal));
                        },
                      ),
                      Text(
                        'Bold',
                        style: getStyle(state.isBolt, false),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: <Widget>[
                      Checkbox(
                          value: state.isItalic,
                          onChanged: (newVal) {
                            settingsBloc.add(Italic(newVal));
                          }),
                      Text(
                        'Italic',
                        style: getStyle(false, state.isItalic),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        )
    );
  }

  TextStyle getStyle([bool isBold = false, bool isItalic = false]) {
    return TextStyle(
      fontSize: 18,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
    );
  }
}
