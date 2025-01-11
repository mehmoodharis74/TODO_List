import 'package:flutter/material.dart';
import 'package:todo_list/data/models/task_model.dart';
class TaskInput extends StatefulWidget {
  final VoidCallback onDelete;
  final Function(Task) onTaskCreated;

  const TaskInput({
    Key? key,
    required this.onDelete,
    required this.onTaskCreated,
  }) : super(key: key);

  @override
  _TaskInputState createState() => _TaskInputState();
}

class _TaskInputState extends State<TaskInput> {
  final TextEditingController _taskController = TextEditingController();

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }

  void _handleTaskCreation() {
    if (_taskController.text.trim().isNotEmpty) {
      final task = Task(
        id: DateTime.now().toString(),
        title: _taskController.text.trim(),
        createdAt: DateTime.now(),
        isCompleted: false, // Ensure tasks default to not completed
      );
      widget.onTaskCreated(task); // Notify parent about task creation
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _taskController,
            decoration: const InputDecoration(
              labelText: 'Task Name',
              border: OutlineInputBorder(),
            ),
            onChanged: (_) => _handleTaskCreation(),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: widget.onDelete,
        ),
      ],
    );
  }
}
