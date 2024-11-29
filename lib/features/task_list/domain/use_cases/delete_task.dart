import 'package:tasks/features/task_list/domain/repositories/task_repository.dart';

//Caso de uso para eliminar una tarea en base al Id de la tarea
class DeleteTaskUseCase {
  final TaskRepository repository;

  DeleteTaskUseCase({required this.repository});

  //Se llama al iniciar el caso de uso y elimina la tarea seleccionada
  Future<bool> call(String id){
    return repository.deleteTask(id: id);
  }
}