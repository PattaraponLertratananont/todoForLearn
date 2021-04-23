import 'package:flutter/material.dart';

void routeTo({
  required BuildContext context,
  required dynamic screen,
}) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => screen,
  ));
}
