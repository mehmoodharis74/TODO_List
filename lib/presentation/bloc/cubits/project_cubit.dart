import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/data/models/project_model.dart';
import 'package:todo_list/data/models/task_model.dart';
import 'package:todo_list/core/utils/project_operation_type.dart';
import 'package:todo_list/domain/usecases/project_opreation_usecase.dart';

class ProjectCubit extends Cubit<List<Project>> {
  final ProjectOperationUseCase projectOperationUseCase;

  ProjectCubit(this.projectOperationUseCase) : super([]);

  Future<void> addProject(Project project) async {
    await projectOperationUseCase.performOperation(
      ProjectOperationType.add, 
      project: project
    );
    final projects = await projectOperationUseCase.performOperation(
      ProjectOperationType.load
    );
    emit(projects);
  }

  Future<void> loadProjects() async {
    final projects = await projectOperationUseCase.performOperation(
      ProjectOperationType.load
    );
    emit(projects);
  }

  Future<void> deleteProject(String id) async {
    await projectOperationUseCase.performOperation(
      ProjectOperationType.delete, 
      project: Project(id: id, name: '', description: '')
    );
    final projects = await projectOperationUseCase.performOperation(
      ProjectOperationType.load
    );
    emit(projects);
  }

  Future<void> updateProjectProgress(String projectId, double progress, {List<Task>? updatedTasks}) async {
    final currentProject = state.firstWhere((p) => p.id == projectId);
    final updatedProject = currentProject.copyWith(
      progress: progress,
      tasks: updatedTasks ?? currentProject.tasks,
    );
    
    await projectOperationUseCase.performOperation(
      ProjectOperationType.update, 
      project: updatedProject
    );
    
    final projects = await projectOperationUseCase.performOperation(
      ProjectOperationType.load
    );
    emit(List.from(projects));
  }
}