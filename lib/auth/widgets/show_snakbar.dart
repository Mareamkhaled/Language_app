 import 'package:flutter/material.dart';

void showSnakBar(BuildContext context,String msg) {
     ScaffoldMessenger.of(context).showSnackBar( SnackBar(
         
          content: Text(msg)));
  }