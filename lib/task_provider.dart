import 'package:flutter/material.dart';
import 'task.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  // Create
  void addTask(String title) {
    final task = Task(
      id: DateTime.now().toString(),
      title: title,
    );
    _tasks.add(task);
    notifyListeners();
  }

  // Read (already handled by the `tasks` getter)


  void editTask(String id, String newTitle) {
    final task = _tasks.firstWhere((task) => task.id == id);
    task.title = newTitle;
    notifyListeners();
  }

  // Update
  void toggleTask(String id) {
    final task = _tasks.firstWhere((task) => task.id == id);
    task.toggleDone();
    notifyListeners();
  }

  // Delete
  void deleteTask(String id) {
    _tasks.removeWhere((task) => task.id == id);
    notifyListeners();
  }
}