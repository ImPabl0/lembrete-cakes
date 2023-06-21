// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Responsive {
  final BuildContext context;
  Responsive({
    required this.context,
  });

  double get altura => MediaQuery.of(context).size.height;
  double get largura => MediaQuery.of(context).size.width;

  double get fractional => (altura + largura) / 140;
}
