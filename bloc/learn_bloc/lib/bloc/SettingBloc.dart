import 'package:bloc/bloc.dart';
import 'package:learnbloc/bloc/SettingState.dart';
import 'package:learnbloc/bloc/SettingsEvent.dart';

class SettingBloc extends Bloc<SettingsEvent, SettingsState>{
  @override
  SettingsState get initialState => InitialSettingsState();


  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) async*{
    if(event is FontSize){
      yield NewSettingState.fromOldSettingState(state, sliderFontSize: event.payload);
    }else if(event is Bold){
      yield NewSettingState.fromOldSettingState(state, isBolt: event.payload);
    }else if(event is Italic){
      yield NewSettingState.fromOldSettingState(state, isItalic: event.payload);
    }
  }


}