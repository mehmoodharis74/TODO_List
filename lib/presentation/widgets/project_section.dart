import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/data/models/project_model.dart';
import 'package:todo_list/presentation/bloc/cubits/project_cubit.dart';
import 'package:todo_list/presentation/widgets/project_card.dart';

class ProjectSection extends StatefulWidget {
  @override
  _ProjectSectionState createState() => _ProjectSectionState();
}

class _ProjectSectionState extends State<ProjectSection> {
  @override
  void initState() {
    super.initState();
    // Load projects when the widget initializes
    context.read<ProjectCubit>().loadProjects();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectCubit, List<Project>>(
      builder: (context, projects) {
        return Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Projects',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            projects.isEmpty
                ? const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      'No projects',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: projects.length,
                    itemBuilder: (context, index) {
                      return ProjectCard(project: projects[index]);
                    },
                  ),
          ],
        );
      },
    );
  }
}