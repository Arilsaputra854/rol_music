import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void CustomDialog(BuildContext context, String message,
    {Future<void> Function()? function}) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Perhatian!"),
          content: Text(message),
          actions: [
            ElevatedButton(
                onPressed: () async {
                  if (function != null) {
                    function();
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: Text("Oke"))
          ],
        );
      });
}
