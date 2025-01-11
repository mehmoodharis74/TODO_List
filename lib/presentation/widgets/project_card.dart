import 'package:flutter/material.dart';
import 'package:todo_list/core/router/app_route.gr.dart';
import 'package:todo_list/data/models/project_model.dart';
import 'package:auto_route/auto_route.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AutoRouter.of(context).push(EditProjectRoute(project: project));
      },
      child: Card(
        elevation: 0,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: Colors.black, width: 1),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                project.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                project.description,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              LinearProgressIndicator(
                value: project.progress,
                backgroundColor: Colors.grey[300],
                color: Colors.blueAccent,
              ),
              const SizedBox(height: 8),
              Text(
                'Progress: ${(project.progress * 100).toStringAsFixed(0)}%',
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 