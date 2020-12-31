import 'package:flutter/material.dart';
class Transaction {
  String content;
  int amount;
  DateTime createdDate;
  Transaction({this.content, this.amount, this.createdDate});
  @override
  String toString() {
    return 'content: $content, amount $amount';
  }
}