import 'package:flutter/material.dart';

void getSnackBar(BuildContext context, text) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
