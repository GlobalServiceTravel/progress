import 'package:flutter/material.dart';

Widget elevatedButton(String text, VoidCallback onPressed) {
  return ElevatedButton(onPressed: onPressed, child: Text(text));
}
