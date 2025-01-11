import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/core/components/todo_button_component.dart';
import 'package:todo_list/core/constants/Constants.dart';
import 'package:todo_list/data/models/project_model.dart';
import 'package:todo_list/data/models/task_model.dart';
import 'package:todo_list/presentation/bloc/cubits/project_cubit.dart';
import 'package:todo_list/presentation/widgets/task_input.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class ProjectScreen extends StatefulWidget {
  @override
  _ProjectScreenState createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final List<Task> tasks = [];

  void _addTaskInput() {
    setState(() {
      tasks.add(
        Task(
          id: DateTime.now().toString(),
          title: '', // Initially empty
          createdAt: DateTime.now(),
          isCompleted: false,
        ),
      );
    });
  }

  void _removeTaskInput(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  void _updateTask(int index, Task updatedTask) {
    setState(() {
      tasks[index] = updatedTask;
    });
  }

  void _createProject() {
    final project = Project(
      id: DateTime.now().toString(),
      name: _nameController.text,
      description: _descriptionController.text,
      tasks: tasks,
    );

    context.read<ProjectCubit>().addProject(project);
    AutoRouter.of(context).back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Project')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Project Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            const Text('Tasks', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...tasks.asMap().entries.map((entry) {
                      final index = entry.key;
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TaskInput(
                          onDelete: () => _removeTaskInput(index),
                          onTaskCreated: (updatedTask) => _updateTask(index, updatedTask),
                        ),
                      );
                    }).toList(),
                    const SizedBox(height: 10),
                    GestureDetector(
              onTap: _addTaskInput,
              child: Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.add, color: Colors.white, size: 16),
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    'Add Task',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: TodoTextButton(text: Constants.createProjectButton, onClick: _createProject, buttonType: TodoButtonType.primary),
            ),
            const SizedBox(height: 16)
            
          ],
        ),
      ),
    );
  }
}