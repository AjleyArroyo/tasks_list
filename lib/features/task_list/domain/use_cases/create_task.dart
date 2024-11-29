import 'package:tasks/features/task_list/domain/entities/task.dart';
import 'package:tasks/features/task_list/domain/repositories/task_repository.dart';

//Caso de uso para eliminar una tarea en base al Id de la tarea
class CreateaskUseCase {
  final TaskRepository repository;

  CreateaskUseCase({required this.repository});

  //Se llama al iniciar el caso de uso y elimina la tarea seleccionada
  Future<bool> call(Task task){
    return repository.createTask(task);
  }
}