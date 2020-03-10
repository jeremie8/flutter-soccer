import 'package:flutter/material.dart';

class Controls{
  static TextEditingController getController(String text) {
    if (text == null) text = "";
    return new TextEditingController.fromValue(new TextEditingValue(
        text: text,
        selection: new TextSelection.collapsed(offset: text.length)));
  }
}