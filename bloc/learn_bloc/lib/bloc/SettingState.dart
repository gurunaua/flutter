
import 'package:flutter/material.dart';

@immutable
abstract class SettingsState{
  final double sliderFontSize;
  final bool isBolt;
  final bool isItalic;
  SettingsState({this.sliderFontSize, this.isBolt, this.isItalic});

  double get fontSize => sliderFontSize * 30;
}

class InitialSettingsState extends SettingsState{
  InitialSettingsState(): super(sliderFontSize:0.5, isBolt: false, isItalic:false);
}

class NewSettingState extends SettingsState{
  NewSettingState.fromOldSettingState(SettingsState oldState,
      {double sliderFontSize, bool isBolt, bool isItalic})
      : super(
      sliderFontSize: sliderFontSize ?? oldState.sliderFontSize,
      isBolt: isBolt ?? oldState.isBolt,
      isItalic: isItalic ?? oldState.isItalic,

  );
}



