import 'package:todo_list/data/models/project_model.dart';
import 'package:todo_list/domain/datasources/local_datasource.dart';
import 'package:todo_list/domain/repositories/project_repository.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final LocalDataSource localDataSource;

  ProjectRepositoryImpl(this.localDataSource);

  @override
  Future<void> addProject(Project project) async {
    await localDataSource.addProject(project);
  }

  @override
  Future<List<Project>> getProjects() async {
    return await localDataSource.getProjects();
  }

  @override
  Future<void> deleteProject(String id) async {
    await localDataSource.deleteProject(id);
  }

  @override
  Future<void> updateProject(Project project) async {
    await localDataSource.updateProject(project);
  }
}