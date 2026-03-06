import 'package:flutter/material.dart';
import 'package:collaboration/model/the_task.dart';

class CardModel extends ChangeNotifier {
  final List<Task> card = [];

  void addTask(Task task) {
    card.add(task);
    notifyListeners();
  }

  void removeTask(Task task) {
    card.remove(task);
    notifyListeners();
  }
}
