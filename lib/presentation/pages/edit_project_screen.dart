import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/data/models/project_model.dart';
import 'package:todo_list/data/models/task_model.dart';
import 'package:todo_list/presentation/bloc/cubits/project_cubit.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class EditProjectScreen extends StatefulWidget {
  final Project project;

  const EditProjectScreen({Key? key, required this.project}) : super(key: key);

  @override
  _EditProjectScreenState createState() => _EditProjectScreenState();
}
class _EditProjectScreenState extends State<EditProjectScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectCubit, List<Project>>(
      builder: (context, projects) {
        final project = projects.firstWhere((p) => p.id == widget.project.id);

        return Scaffold(
          appBar: AppBar(title: Text(project.name)),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.blue, Colors.lightBlueAccent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                project.name,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              height: 60,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  CircularProgressIndicator(
                                    value: project.progress,
                                    strokeWidth: 3.0,
                                    backgroundColor: const Color.fromARGB(255, 69, 69, 69).withOpacity(0.3),
                                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                                  ),
                                  Text(
                                    '${(project.progress * 100).toStringAsFixed(0)}%',
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          project.description,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Tasks',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: ReorderableListView.builder(
                          onReorder: (oldIndex, newIndex) {
                            if (oldIndex < newIndex) {
                              newIndex -= 1;
                            }
                            final List<Task> newTasks = List.from(project.tasks);
                            final Task task = newTasks.removeAt(oldIndex);
                            newTasks.insert(newIndex, task);
                            
                            // Update project with new task order
                            context.read<ProjectCubit>().updateProjectProgress(
                              project.id,
                              project.progress,
                              updatedTasks: newTasks,
                            );
                          },
                          itemCount: project.tasks.length,
                          itemBuilder: (context, index) {
                            final task = project.tasks[index];
                            return Container(
                              key: ValueKey(task.id),
                              margin: const EdgeInsets.symmetric(vertical: 4),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.inversePrimary,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          _toggleTaskCompletion(index, project);
                                        },
                                        child: Text(
                                          task.title,
                                          style: const TextStyle(color: Colors.black, fontSize: 18),
                                        ),
                                      ),
                                    ),
                                    Checkbox(
                                      value: task.isCompleted,
                                      onChanged: (value) {
                                        _toggleTaskCompletion(index, project);
                                      },
                                      activeColor: Colors.blue,
                                      checkColor: Colors.white,
                                    ),
                                    const Icon(Icons.drag_handle),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _toggleTaskCompletion(int index, Project project) async {
    final updatedTasks = [...project.tasks];
    updatedTasks[index] = Task(
      id: updatedTasks[index].id,
      title: updatedTasks[index].title,
      isCompleted: !updatedTasks[index].isCompleted,
      createdAt: updatedTasks[index].createdAt,
    );

    final completedTasks = updatedTasks.where((task) => task.isCompleted).length.toDouble();
    final totalTasks = updatedTasks.length.toDouble();
    final progress = totalTasks > 0 ? completedTasks / totalTasks : 0.0;

    await context.read<ProjectCubit>().updateProjectProgress(
      project.id,
      progress,
      updatedTasks: updatedTasks,
    );
  }
}
