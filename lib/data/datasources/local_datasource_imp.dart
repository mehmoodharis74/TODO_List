import 'package:todo_list/data/models/project_model.dart';
import 'package:todo_list/domain/datasources/local_datasource.dart';

class LocalDataSourceImpl implements LocalDataSource {
  final List<Project> _projects = [];

  @override
  Future<void> addProject(Project project) async {
    _projects.add(project);
  }

  @override
  Future<List<Project>> getProjects() async {
    return List.from(_projects);
  }

  @override
  Future<void> deleteProject(String id) async {
    _projects.removeWhere((project) => project.id == id);
  }

  @override
  Future<void> updateProject(Project updatedProject) async {
    final index = _projects.indexWhere((p) => p.id == updatedProject.id);
    if (index != -1) {
      _projects[index] = updatedProject;
    }
  }
}