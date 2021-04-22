import 'package:flutter/material.dart';

void routeTo({@required BuildContext context, @required Widget screen}) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => screen,
  ));
}
