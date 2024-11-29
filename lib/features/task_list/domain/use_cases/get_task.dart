import 'package:tasks/features/task_list/domain/entities/task.dart';
import 'package:tasks/features/task_list/domain/repositories/task_repository.dart';

//Caso de uso para obtener las tareas que creo el usuario
class GetTaskUseCase {
  final TaskRepository repository;

  GetTaskUseCase({required this.repository});

  //Se llama al inciar el caso de uso y llama al repositorio de obtener las tareas
  Future<List<Task>> call(){

    return repository.getTask();
  }

}