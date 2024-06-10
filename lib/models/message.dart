import 'package:flutter/material.dart';

class Message {
  final String sender;
  final String text;
  final DateTime time;

  const Message({
    required this.sender,
    required this.text,
    required this.time,
  });
}
