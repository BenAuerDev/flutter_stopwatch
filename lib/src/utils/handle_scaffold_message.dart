import 'package:flutter/material.dart';

void handleScaffoldMessage(
  BuildContext context,
  String message,
) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}
