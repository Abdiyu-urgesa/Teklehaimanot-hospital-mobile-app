import 'package:flutter/material.dart';

class snackBar {
  final String msg;
  final Color? clr;
  const snackBar({
    required this.msg,
    this.clr,
  });

  static show(BuildContext context, String msg, Color clr) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      elevation: 0.0,
      backgroundColor: clr,
      behavior: SnackBarBehavior.floating,
      content: Text(msg),
      duration: const Duration(seconds: 3),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      action: SnackBarAction(
        label: "Ok",
        onPressed: () {},
        textColor: Colors.white,
      ),
    ));
  }
}
