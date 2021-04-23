import 'package:flutter/material.dart';

Widget titleBar({dynamic action, required String nameAction}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        "TODO",
        style: TextStyle(fontSize: 20),
      ),
      TextButton(
        onPressed: action,
        child: Text(
          nameAction,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    ],
  );
}
