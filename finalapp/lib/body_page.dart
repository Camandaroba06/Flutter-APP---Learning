import 'package:flutter/material.dart';

Widget pageBody(String tittle, String description, String imgURL) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      children: [
        Image.network(imgURL),
        Text(
          tittle,
          style: TextStyle(
              fontSize: 40, color: Colors.black54, fontWeight: FontWeight.bold),
        ),
        Text(
          description,
          style: TextStyle(fontSize: 20, color: Colors.black26),
        ),
      ],
    ),
  );
}
