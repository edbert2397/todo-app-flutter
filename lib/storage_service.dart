import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/models/task.dart';

class StorageService {
  Future<void> savePriorityItems(List<Task> items) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> stringList = items.map((item) => jsonEncode(item.toJson())).toList();
    await prefs.setStringList('priorityItems', stringList);
  }

  Future<List<Task>> loadPriorityItems() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> stringList = prefs.getStringList('priorityItems') ?? [];
    List<Task> items = stringList.map((itemStr) => Task.fromJson(jsonDecode(itemStr))).toList();
    return items;
  }
  Future<void> saveDailyItems(List<Task> items) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> stringList = items.map((item) => jsonEncode(item.toJson())).toList();
    await prefs.setStringList('dailyItems', stringList);
  }

  Future<List<Task>> loadDailyItems() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> stringList = prefs.getStringList('dailyItems') ?? [];
    List<Task> items = stringList.map((itemStr) => Task.fromJson(jsonDecode(itemStr))).toList();
    return items;
  }
}
