import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';


@JsonSerializable()
class Task{
  String title;
  String description;
  bool isPriority;
  bool isSelected;
  double progress;
  Task({required this.title,required this.description,required this.isPriority,required this.isSelected,required this.progress});

  // JSON serialization
  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
  Map<String, dynamic> toJson() => _$TaskToJson(this);
}

