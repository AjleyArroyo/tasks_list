import 'package:tasks/task_list/domain/repositories/task_repository.dart';

class UpdateTaskUseCase {
  final TaskRepository repository;

  UpdateTaskUseCase({required this.repository});
  

  Future<bool> call(bool state){
    return repository.updateTask(state: state);
  }

}