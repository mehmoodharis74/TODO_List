import 'package:todo_list/data/models/project_model.dart';

abstract class LocalDataSource {
  Future<void> addProject(Project project);
  Future<List<Project>> getProjects();
  Future<void> deleteProject(String id);
  Future<void> updateProject(Project project);
} 