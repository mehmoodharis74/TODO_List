import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/core/router/app_route.gr.dart';
import 'package:todo_list/presentation/pages/weather_screen.dart';
import 'package:todo_list/presentation/widgets/project_section.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  void _addProject(BuildContext context) {
    context.router.push(const ProjectRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TODO', style: TextStyle(fontWeight: FontWeight.bold),)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Weather Section
            WeatherScreen(),
            const SizedBox(height: 20),
            // Project Section
            ProjectSection(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addProject(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}