import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget imageFromBase64String(String? base64String) {
  if (base64String == null || base64String.isEmpty)
    return Container(
      color: Colors.white,
      child: new LayoutBuilder(builder: (context, constraint) {
        return new Icon(Icons.visibility_off, size: constraint.biggest.height);
      }),
    );

  return Image.memory(
    base64Decode(base64String.split(",")[1]),
    fit: BoxFit.fill,
  );
  // return FlutterLogo(size: 100.0);
}

Widget imageFromBase64String2(String? base64String) {
  if (base64String == null || base64String.isEmpty) return Icon(Icons.image);

  return Image.memory(
    base64Decode(base64String.split(",")[1]),
    fit: BoxFit.fill,
  );
  // return FlutterLogo(size: 100.0);
}

Uint8List dataFromBase64String(String base64String) {
  return base64Decode(base64String);
}

String base64String(Uint8List data) {
  return base64Encode(data);
}
