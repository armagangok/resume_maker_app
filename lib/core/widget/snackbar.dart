import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

void getSnackBar(BuildContext context, String message) => Flushbar(
      title: "Warning",
      message: message,
      duration: const Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: Colors.grey[800]!.withOpacity(0.7),
    )..show(context);

    
