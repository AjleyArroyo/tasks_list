import 'package:tasks/features/task_list/domain/repositories/task_repository.dart';

//Caso de uso para acutualizar el estado de una tarea
class UpdateTaskUseCase {
  final TaskRepository repository;

  UpdateTaskUseCase({required this.repository});
  
  //Al iniciar la clase se hace la llamada para actualizar el estado
  Future<bool> call(String id, bool state){
    return repository.updateTask(id: id, state: state);
  }

}