import 'package:todo_list/data/models/task_model.dart';

class Project {
  final String id;
  final String name;
  final String description;
  final double progress;
  final List<Task> tasks;

  Project({
    required this.id,
    required this.name,
    required this.description,
    this.progress = 0.0,
    this.tasks = const [],
  });

  Project copyWith({
    String? id,
    String? name,
    String? description,
    double? progress,
    List<Task>? tasks,
  }) {
    return Project(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      progress: progress ?? this.progress,
      tasks: tasks ?? this.tasks,
    );
  }
}

