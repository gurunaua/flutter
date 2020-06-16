abstract class SettingsEvent{
  final dynamic payload;
  SettingsEvent(this.payload);
}

class FontSize extends SettingsEvent{
  FontSize(payload) : super(payload);
}

class Bold extends SettingsEvent{
  Bold(payload) : super(payload);
}

class Italic extends SettingsEvent{
  Italic(payload) : super(payload);

}