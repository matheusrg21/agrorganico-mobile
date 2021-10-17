import 'package:flutter/material.dart';

void showConfirmationDialog(String message, BuildContext context,
    [title = 'Ocorreu um erro!']) {
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          child: Text('OK'),
          onPressed: () {
            Navigator.of(ctx).pop();
          },
        ),
      ],
    ),
  );
}
