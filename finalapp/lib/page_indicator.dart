import 'package:flutter/material.dart';

Widget pageIndicator(bool page) {
  return Container(
    width: page ? 15 : 10,
    height: page ? 15 : 10,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: page ? Colors.black87 : Colors.black38,
    ),
  );
}
