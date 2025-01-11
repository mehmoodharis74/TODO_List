import 'task_entity.dart';

class TodoListEntity {
  final String id;
  final String name;
  final List<TaskEntity> tasks;

  TodoListEntity({
    required this.id,
    required this.name,
    this.tasks = const [],
  });
}
