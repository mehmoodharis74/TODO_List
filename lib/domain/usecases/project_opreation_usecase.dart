import 'package:todo_list/data/models/project_model.dart';
import 'package:todo_list/domain/repositories/project_repository.dart';
import 'package:todo_list/core/utils/project_operation_type.dart';

class ProjectOperationUseCase {
  final ProjectRepository projectRepository;

  ProjectOperationUseCase(this.projectRepository);

  Future<List<Project>> performOperation(ProjectOperationType operationType, {Project? project}) async {
    switch (operationType) {
      case ProjectOperationType.add:
        if (project != null) {
          await projectRepository.addProject(project);
        }
        return await projectRepository.getProjects();
        
      case ProjectOperationType.update:
        if (project != null) {
          await projectRepository.updateProject(project);
        }
        return await projectRepository.getProjects();
        
      case ProjectOperationType.delete:
        if (project != null) {
          await projectRepository.deleteProject(project.id);
        }
        return await projectRepository.getProjects();
        
      case ProjectOperationType.load:
        return await projectRepository.getProjects();
    }
  }
}