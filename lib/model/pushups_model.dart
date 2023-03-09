import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PushupsModel {
  DateTime saveTime;
  int count;
  List<int> countSets;

  PushupsModel(
      {required this.saveTime, required this.count, required this.countSets});

  factory PushupsModel.fromJson(Map<String, dynamic> jsonData) {
    //print('jsonData: $jsonData');
    DateTime dt =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(jsonData['saveTime']);
    int count = jsonData['count'];
    DateTime saveTime = dt;
    List<dynamic> list = jsonData['countSets'].toList();

    return PushupsModel(
        saveTime: dt,
        count: jsonData['count'],
        countSets: List<int>.from(jsonData['countSets'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'saveTime': saveTime.toIso8601String(),
      'count': count,
      'countSets': countSets
    };
  }
}
