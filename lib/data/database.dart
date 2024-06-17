import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List toDoList = [];
  final _myBox = Hive.box('mybox');

  void createInitialData() {
    toDoList = [
      [
        "Drink Water",
        false,
        TimeOfDay(hour: 9, minute: 0),
        TimeOfDay(hour: 10, minute: 0)
      ],
    ];
    updateDataBase(); // Ensure the initial data is stored in the database
  }

  void loadData() {
    List rawList = _myBox.get("TODOLIST") ?? [];
    toDoList = rawList.map((item) {
      return [
        item[0],
        item[1],
        TimeOfDay(hour: item[2][0], minute: item[2][1]),
        TimeOfDay(hour: item[3][0], minute: item[3][1]),
      ];
    }).toList();
  }

  void updateDataBase() {
    List rawList = toDoList.map((item) {
      return [
        item[0],
        item[1],
        [item[2].hour, item[2].minute],
        [item[3].hour, item[3].minute],
      ];
    }).toList();
    _myBox.put("TODOLIST", rawList);
  }
}
